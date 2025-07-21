#!/usr/bin/zsh

### Job Parameters
#SBATCH --account=lect0151
#SBATCH --ntasks=1
#SBATCH -J eval_inat_vae_v1-3
#SBATCH --gres=gpu:1
#SBATCH --time=03:00:00
#SBATCH --output=/hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning/logs/metrics-%J.log
#SBATCH --mem=64G


cd /hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning

source /hpcwork/oh275203/xcm/bin/activate

python3 /hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning/audioldm_train/audioldm_eval/eval_v2.py
