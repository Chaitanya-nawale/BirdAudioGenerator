#!/usr/bin/zsh

### Job Parameters
#SBATCH --account=lect0151
#SBATCH --ntasks=1
#SBATCH -J eval_inat_s_v1-2
#SBATCH --gres=gpu:1
#SBATCH --time=03:00:00
#SBATCH --output=logs/eval_inat_s_v2-57994691.log
#SBATCH --mem=64G

cd /hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning

source .venv/bin/activate

python3 audioldm_train/eval.py --log_path log/latent_diffusion/2023_08_23_reproduce_audioldm --exp_name audioldm_original_inaturalist_v1-2