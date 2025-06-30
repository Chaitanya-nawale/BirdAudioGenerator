#!/usr/bin/zsh

### Job Parameters
#SBATCH --account=lect0151
#SBATCH --ntasks=1
#SBATCH -J tr_inat_s_v1-2
#SBATCH --gres=gpu:1
#SBATCH --time=06:00:00
#SBATCH --output=logs/inat_s_v1-2%j.log
#SBATCH --mem=120G

cd /hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning

source .venv/bin/activate

python3 audioldm_train/train/latent_diffusion.py -c audioldm_train/config/2023_08_23_reproduce_audioldm/audioldm_original_inaturalist_v1-2.yaml --reload_from_ckpt log/latent_diffusion/2023_08_23_reproduce_audioldm/audioldm_original_inaturalist_v1-1/checkpoints/checkpoint-fad-133.00-global_step=4999.ckpt
