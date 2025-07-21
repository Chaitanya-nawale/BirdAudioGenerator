#!/usr/bin/zsh

### Job Parameters
#SBATCH --account=lect0151
#SBATCH --ntasks=1
#SBATCH -J eval_inat_vae_v1-3
#SBATCH --gres=gpu:1
#SBATCH --time=03:00:00
#SBATCH --output=logs/eval_inat_vae_v1-3_-%J.log
#SBATCH --mem=64G

cd /hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning

source .venv/bin/activate

python3 audioldm_train/eval.py --gen_files_path "log/vae/2023_11_13_vae_autoencoder/16k_64_inat/audioldm_vae_inat_v0-0/0/fbank_wav_prediction" --gt_files_path "log/vae/2023_11_13_vae_autoencoder/16k_64_inat/audioldm_vae_inat_v0-0/0/fbank_vocoder_gt_wave"

python3 audioldm_train/eval.py --gen_files_path "log/vae/2023_11_13_vae_autoencoder/16k_64_inat/audioldm_vae_inat_v1-1/0/fbank_wav_prediction" --gt_files_path "log/vae/2023_11_13_vae_autoencoder/16k_64_inat/audioldm_vae_inat_v1-1/0/fbank_vocoder_gt_wave"