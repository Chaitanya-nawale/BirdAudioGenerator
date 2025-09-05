#!/usr/bin/zsh

### Job Parameters
#SBATCH --account=lect0151
#SBATCH --partition=c23g
#SBATCH -J tr_ldm_xcl_v3
#SBATCH --gres=gpu:2
#SBATCH --mem-per-gpu=96G
#SBATCH --cpus-per-gpu=16
#SBATCH --time=24:00:00
#SBATCH --output=logs/ldm_xcl_v3_1_%j.log

cd /hpcwork/wr356426/stablelofieditor/AudioLDM-training-finetuning/

source .venv/bin/activate

PYTHONPATH=. python3 audioldm_train/train/latent_diffusion.py -c audioldm_train/config/2023_08_23_reproduce_audioldm/audioldm_original_xcl_v3_1.yaml