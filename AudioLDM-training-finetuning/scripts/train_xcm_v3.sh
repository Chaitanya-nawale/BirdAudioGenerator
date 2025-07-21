#!/usr/bin/zsh

### Job Parameters
#SBATCH --account=lect0151
#SBATCH -J tr_ldm_xcm_v1
#SBATCH --gres=gpu:2
#SBATCH --mem-per-gpu=96G
#SBATCH --cpus-per-gpu=16
#SBATCH --time=36:00:00
#SBATCH --output=logs/ldm_xcm_v3_%j.log

cd /hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning

source /hpcwork/oh275203/xcm/bin/activate

python3 audioldm_train/train/latent_diffusion.py -c audioldm_train/config/2023_08_23_reproduce_audioldm/audioldm_original_xcm_v3.yaml --reload_from_ckpt data/checkpoints/audioldm-s-full