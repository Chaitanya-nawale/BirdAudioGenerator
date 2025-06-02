#!/usr/bin/zsh

### Job Parameters
#SBATCH --account=lect0151
#SBATCH --partition=c23g
#SBATCH --ntasks=1
#SBATCH -J tr_inat_s
#SBATCH --gres=gpu:1
#SBATCH --time=04:00:00
#SBATCH --output=logs/inat_s_v1-0%j.log
#SBATCH --mem=120G

cd /hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning

mkdir -p logs

source .venv/bin/activate

python3 audioldm_train/train/latent_diffusion.py -c audioldm_train/config/2023_08_23_reproduce_audioldm/audioldm_original_inaturalist_v1-0.yaml --reload_from_ckpt data/inat_checkpoints/audioldm-s-full
