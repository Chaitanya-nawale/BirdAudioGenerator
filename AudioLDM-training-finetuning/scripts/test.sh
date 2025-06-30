#!/usr/bin/zsh

### Job Parameters
#SBATCH --account=lect0151
#SBATCH --partition=c23g
#SBATCH --ntasks=1
#SBATCH -J tr_inat_s
#SBATCH --gres=gpu:1
#SBATCH --time=05:00:00
#SBATCH --output=logs/infer_v1-0%j.log
#SBATCH --mem=120G

cd /hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning

mkdir -p logs

source .venv/bin/activate

which python  
python3 -m pip show torch 

python3 scripts/check.py 