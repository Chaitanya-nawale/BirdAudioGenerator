#!/usr/bin/zsh

### Job Parameters
#SBATCH --account=lect0151
#SBATCH --partition=c23g
#SBATCH --ntasks=1
#SBATCH -J tr_inat_s
#SBATCH --gres=gpu:1
#SBATCH --time=05:00:00
#SBATCH --output=/hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning/logs/infer_base%j.log
#SBATCH --mem=120G

cd /hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning

source /hpcwork/oh275203/xcm/bin/activate

python3 audioldm_train/infer.py --config_yaml audioldm_train/config/2023_08_23_reproduce_audioldm/audioldm_original_xcm_v1.yaml --reload_from_ckpt /hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning/log/latent_diffusion/2023_08_23_reproduce_audioldm/audioldm_original/checkpoints/audioldm-s-full --list_inference tests/captionlist/inference_base.lst
