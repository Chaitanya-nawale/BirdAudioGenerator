#!/usr/bin/zsh

### Job Parameters
#SBATCH --account=lect0151
#SBATCH --ntasks=1
#SBATCH -J eval_xcl_v1
#SBATCH --gres=gpu:1
#SBATCH --time=03:00:00
#SBATCH --output=/hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning/logs/eval_xcl_v1_%j.log
#SBATCH --mem=64G

cd /hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning/audioldm_train

source /hpcwork/wr356426/stablelofieditor/AudioLDM-training-finetuning/.venv/bin/activate

PYTHONPATH=/hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning/audioldm_train python3 eval_xcl.py --log_path /hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning/log/latent_diffusion/2023_08_23_reproduce_audioldm --exp_name audioldm_original_xcl_v1_1