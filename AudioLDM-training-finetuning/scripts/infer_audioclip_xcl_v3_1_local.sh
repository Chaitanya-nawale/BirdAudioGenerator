#!/usr/bin/zsh

### Job Parameters
#SBATCH --ntasks=1
#SBATCH -J infer_ldm_aclp_xcl
#SBATCH --gres=gpu:1
#SBATCH --time=05:00:00
#SBATCH --output=logs/infer_ldm_aclp_xcl_%j.log
#SBATCH --mem=120G

cd /hpcwork/wr356426/stablelofieditor/AudioLDM-training-finetuning

source .venv/bin/activate

PYTHONPATH=. python3 audioldm_train/infer.py --config_yaml audioldm_train/config/2023_08_23_reproduce_audioldm/audioldm_original_xcl_infer_v3_1.yaml --reload_from_ckpt log/latent_diffusion/2023_08_23_reproduce_audioldm/audioldm_original_xcl_v3_1/checkpoints/checkpoint-fad-133.00-global_step=44999.ckpt --list_inference tests/captionlist/inference_test_birdnames.lst
