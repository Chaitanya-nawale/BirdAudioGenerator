# Get the list of .wav files from a source directory and copy them to a destination directory
# To get audio generated vs ground truth audio files, we can use the following script

import os
import shutil

def copy_wav_files(file_names, src_folder, dst_folder):
    """
    Copies .wav files listed in file_names from src_folder to dst_folder.

    Args:
        file_names (list): List of .wav file names (with extension).
        src_folder (str): Source directory path.
        dst_folder (str): Destination directory path.
    """
    os.makedirs(dst_folder, exist_ok=True)
    for file_name in file_names:
        src_path = os.path.join(src_folder, file_name)
        dst_path = os.path.join(dst_folder, file_name)
        if os.path.isfile(src_path):
            shutil.copy2(src_path, dst_path)
        else:
            print(f"File not found: {src_path}")

# Example usage:
file_names=  ['1e8e863e-1b90-4751-b1cd-8faeaff477b2.wav',
 '1fbc1395-2fe6-4bf5-bbe5-9a37a617ea2b.wav',
 '13d91b3d-2411-4057-a4a5-551fc7f1dea5.wav',
 '21c81e4f-b507-4f3d-9c49-e7b4490b28fc.wav',
 '412b4df7-8e22-45d0-a2f1-769afef6d579.wav',
 '936363d2-2f98-41fd-8308-ffe5faaacb96.wav',
 '987193b2-a649-475d-9110-62f6888f9ecc.wav',
 'c0f0a946-8cf1-4257-a6bf-283802f7fc44.wav',
 'd7346d89-89ea-49da-839d-47b6ea22b82e.wav',
 'f316c4e0-b4f9-416d-b22f-a53da7c92b90.wav']
copy_wav_files(file_names, '/hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning/log/testset_data/inaturalist', '/hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning/scripts/test_data')