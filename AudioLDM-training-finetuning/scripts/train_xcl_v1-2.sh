#!/usr/bin/zsh

### Job Parameters
#SBATCH --account=lect0151
#SBATCH --partition=c23g
#SBATCH -J tr_ldm_xcl_v1-2
#SBATCH --gres=gpu:2
#SBATCH --mem-per-gpu=96G
#SBATCH --cpus-per-gpu=16
#SBATCH --time=12:00:00
#SBATCH --output=logs/ldm_xcl_v1-2_%j.log

cd /hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning

source .venv/bin/activate

python3 audioldm_train/train/latent_diffusion.py -c audioldm_train/config/2023_08_23_reproduce_audioldm/audioldm_original_xcl_v1_2.yaml --reload_from_ckpt log/latent_diffusion/2023_08_23_reproduce_audioldm/audioldm_original_xcl_v1_1/checkpoints/checkpoint-fad-133.00-global_step=109999.ckpt