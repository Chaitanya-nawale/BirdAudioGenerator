#!/usr/bin/zsh

### Job Parameters
#SBATCH --account=lect0151
#SBATCH --ntasks=1
#SBATCH -J eval_inat_s_v1-2
#SBATCH --gres=gpu:1
#SBATCH --time=03:00:00
#SBATCH --output=/hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning/logs/eval_xcm_v1_%j.log
#SBATCH --mem=64G

cd /hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning

source /hpcwork/oh275203/xcm/bin/activate

python3 audioldm_train/eval_v2.py --log_path /hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning/log/latent_diffusion/2023_08_23_reproduce_audioldm --exp_name audioldm_original_xcm_v1