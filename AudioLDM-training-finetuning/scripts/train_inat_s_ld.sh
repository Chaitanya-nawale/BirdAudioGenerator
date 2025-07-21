#!/usr/bin/zsh

### Job Parameters
#SBATCH --account=lect0151
#SBATCH -J tr_ldm_inat_s_v1-2
#SBATCH --gres=gpu:2
#SBATCH --mem-per-gpu=96G
#SBATCH --cpus-per-gpu=16
#SBATCH --time=12:00:00
#SBATCH --output=logs/ldm_inat_s_v1-3_944999_%j.log

cd /hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning

source .venv/bin/activate

python3 audioldm_train/train/latent_diffusion.py -c audioldm_train/config/2023_08_23_reproduce_audioldm/audioldm_original_inaturalist_v1-2.yaml --reload_from_ckpt log/latent_diffusion/2023_08_23_reproduce_audioldm/audioldm_original_inaturalist_v1-1/checkpoints/checkpoint-fad-133.00-global_step=4999.ckpt