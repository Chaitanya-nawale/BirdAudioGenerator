#!/usr/bin/zsh

### Job Parameters
#SBATCH --account=lect0151
#SBATCH --partition=c23g
#SBATCH --ntasks=1
#SBATCH -J train_audiocaps
#SBATCH -o train_audiocaps.%J.log
#SBATCH --gres=gpu:1
#SBATCH --time=00:15:00 # Run time of 15 minutes
#SBATCH --output=logs/audioldm_audiocaps_%j.log
#SBATCH --mem-per-gpu=48G


#python3 audioldm_train/train/latent_diffusion.py -c audioldm_train/config/2023_08_23_reproduce_audioldm/audioldm_crossattn_flant5.yaml

python3 audioldm_train/train/latent_diffusion.py \
    -c audioldm_train/config/2023_08_23_reproduce_audioldm/audioldm_original.yaml \
    --reload_from_ckpt data/checkpoints/audioldm-s-full

# Train the VAE
# python3 audioldm_train/train/autoencoder.py -c audioldm_train/config/2023_11_13_vae_autoencoder/16k_64.yaml