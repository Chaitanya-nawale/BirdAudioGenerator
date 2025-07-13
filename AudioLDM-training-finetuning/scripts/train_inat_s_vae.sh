#!/usr/bin/zsh

### Job Parameters
#SBATCH --account=lect0151
#SBATCH -J eval_vae_inat_s_v1-3
#SBATCH --gres=gpu:1
#SBATCH --mem-per-gpu=96G
#SBATCH --cpus-per-gpu=16
#SBATCH --time=6:00:00
#SBATCH --output=logs/eval_vae_inat_s_v1-3_%j.log

cd /hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning

source .venv/bin/activate

python3 audioldm_train/train/autoencoder.py -c audioldm_train/config/2023_11_13_vae_autoencoder/16k_64_inat.yaml