#!/usr/bin/zsh

### Job Parameters
#SBATCH --account=lect0151
#SBATCH --partition=c23g
#SBATCH --ntasks=1
#SBATCH -J tr_audiocaps_s
#SBATCH --gres=gpu:1
#SBATCH --time=00:30:00
#SBATCH --output=log/audiocaps_s%j.log
#SBATCH --mem=32G

cd /hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning

mkdir -p logs

source .venv/bin/activate

srun python3 audioldm_train/train/latent_diffusion.py -c audioldm_train/config/2023_08_23_reproduce_audioldm/audioldm_original.yaml --reload_from_ckpt data/checkpoints/audioldm-s-full
