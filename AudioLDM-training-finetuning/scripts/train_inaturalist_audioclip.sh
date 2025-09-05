#!/usr/bin/zsh

### Job Parameters
#SBATCH --account=lect0151
#SBATCH --partition=c23g
#SBATCH --ntasks=1
#SBATCH -J tr_inat_s_v1-2
#SBATCH --gres=gpu:2
#SBATCH --time=06:00:00
#SBATCH --output=logs/inat_s_v2-0%j.log
#SBATCH --mem=120G

cd /hpcwork/wr356426/stablelofieditor/AudioLDM-training-finetuning

source .venv/bin/activate

PYTHONPATH=. python3 audioldm_train/train/latent_diffusion.py -c audioldm_train/config/2023_08_23_reproduce_audioldm/audioldm_original_inaturalist_v2-0.yaml
