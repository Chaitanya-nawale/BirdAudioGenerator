#!/usr/bin/zsh

### Job Parameters
#SBATCH --account=lect0151
#SBATCH --partition=c23g
#SBATCH -J tr_aclp_xcl_v2
#SBATCH --gres=gpu:2
#SBATCH --mem-per-gpu=96G
#SBATCH --cpus-per-gpu=16
#SBATCH --time=18:00:00
#SBATCH --output=logs/aclp_xcl_%j.log

cd /hpcwork/wr356426/stablelofieditor/AudioLDM-training-finetuning

source .venv/bin/activate

cd ./audioldm_train/modules/AudioCLIP

PYTHONPATH=/hpcwork/wr356426/stablelofieditor/AudioLDM-training-finetuning python3 main.py --config protocols/audioclip-inaturalist_v2.json