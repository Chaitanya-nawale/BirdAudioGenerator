import os
import warnings
import multiprocessing as mp

import tqdm
import librosa
from PIL import Image
import soundfile as sf

import numpy as np
import pandas as pd

import torch.utils.data as td

import sklearn.model_selection as skms

import audioldm_train.modules.AudioCLIP.utils.transforms as transforms

from typing import Any
from typing import Dict
from typing import List
from typing import Tuple
from typing import Optional


class INaturalist(td.Dataset):

    def __init__(self,
                 root: str,
                 sample_rate: int = 16000,
                 train: bool = True,
                 fold: Optional[int] = 10,
                 mono: bool = False,
                 transform_audio=None,
                 transform_image=None,
                 target_transform=None,
                 **_):

        super(INaturalist, self).__init__()

        self.root = root
        self.audio_root = "/hpcwork/ml132257/XCL/birds"
        self.image_root = "/hpcwork/lect0151/stablelofieditor/training_data/inat_images/train"
        self.sample_rate = sample_rate
        self.train = train
        self.random_split_seed = None

        if fold is None:
            fold = 10

        if not (1 <= fold <= 10):
            raise ValueError(f'Expected fold in range [1, 10], got {fold}')

        self.fold = fold
        self.folds_to_load = set(range(1, 11))

        if self.fold not in self.folds_to_load:
            raise ValueError(f'fold {fold} does not exist')

        if self.train:
            # if in training mode, keep all but test fold
            self.folds_to_load -= {self.fold}
        else:
            # if in evaluation mode, keep the test samples only
            self.folds_to_load -= self.folds_to_load - {self.fold}

        self.mono = mono

        self.transform_audio = transform_audio
        self.transform_image = transform_image
        self.target_transform = target_transform

        self.data: Dict[str, Dict[str, Any]] = dict()
        self.indices = dict()
        self.load_data()

        self.class_idx_to_label = dict()
        for row in self.data.values():
            idx = row['target']
            label = row['category']
            self.class_idx_to_label[idx] = label
        self.label_to_class_idx = {lb: idx for idx, lb in self.class_idx_to_label.items()}

    @staticmethod
    def _load_worker(fn: str, path_to_audio_file: str, sample_rate: int, path_to_image_file: str, mono: bool = False) -> Tuple[str, int, np.ndarray, np.ndarray]:
        wav, sample_rate_ = sf.read(
            path_to_audio_file,
            dtype='float32',
            always_2d=True
        )

        wav = librosa.resample(wav.T, sample_rate_, sample_rate)

        if wav.shape[0] == 1 and not mono:
            wav = np.concatenate((wav, wav), axis=0)

        wav = wav[:, :sample_rate * 4]
        wav = transforms.scale(wav, wav.min(), wav.max(), -32768.0, 32767.0)

        image = Image.open(path_to_image_file)

        image = transforms.image_transforms(image)

        return fn, sample_rate, wav.astype(np.float32), np.array(image) 

    def load_data(self):
        meta = pd.read_csv(
            os.path.join(self.root, 'metadata', 'audioclip_image_audio_v3.csv'),
            sep=',',
            index_col='id'
        )

        for row_idx, (fn, row) in enumerate(meta.iterrows()):
            path_to_audio_file = os.path.join(self.audio_root, row['wav_path'])
            path_to_image_file = os.path.join(self.image_root, row['file_name'])
            
            self.data[fn] = {
                'audio_path': path_to_audio_file,
                'image_path': path_to_image_file,
                'sample_rate': self.sample_rate,
                'mono': self.mono,
                'target': row['category_id'],
                'category': row['category_name'],
            }

        # by default, the official split from the metadata is used
        files_to_load = list()
        # if the random seed is not None, the random split is used
        if self.random_split_seed is not None:

            # given an integer random seed
            skf = skms.StratifiedKFold(n_splits=10, shuffle=True, random_state=self.random_split_seed)

            # split the inaturalist samples into 10 folds
            for fold_idx, (train_ids, test_ids) in enumerate(skf.split(
                    np.zeros(len(meta)), meta['classID'].values.astype(int)
            ), 1):
                # if this is the fold we want to load, add the corresponding files to the list
                if fold_idx == self.fold:
                    ids = train_ids if self.train else test_ids
                    filenames = meta.iloc[ids].index
                    files_to_load.extend(filenames)
                    break
        else:
            # if the random seed is None, use the official split
            for fn, row in meta.iterrows():
                if int(row['fold']) in self.folds_to_load:
                    files_to_load.append(fn)

        self.data = {fn: vals for fn, vals in self.data.items() if fn in files_to_load}
        self.indices = {idx: fn for idx, fn in enumerate(self.data)}

    def __getitem__(self, index: int) -> Tuple[np.ndarray, np.ndarray, List[str]]:
        if not (0 <= index < len(self)):
            raise IndexError
        item = self.data[self.indices[index]]
        
        audio_path = item['audio_path']
        wav, sample_rate = sf.read(audio_path, dtype='float32', always_2d=True)
        warnings.filterwarnings('ignore')
        wav = librosa.resample(wav.T, sample_rate, item['sample_rate'])

        if wav.shape[0] == 1 and not item['mono']:
            wav = np.concatenate((wav, wav), axis=0)
        wav = wav[:, :item['sample_rate'] * 4]
        wav = transforms.scale(wav, wav.min(), wav.max(), -32768.0, 32767.0)
        wav = wav.astype(np.float32)

        image_path = item['image_path']
        image = np.array(Image.open(image_path))
        image = transforms.image_transforms(image)

        target: str = item['category']

        if self.transform_audio is not None:
            wav = self.transform_audio(wav)
        if self.transform_image is not None:
            image = self.transform_image(image)
        if self.target_transform is not None:
            target = self.target_transform(target)

        return wav, image, [target]

    def __len__(self) -> int:
        return len(self.data)
