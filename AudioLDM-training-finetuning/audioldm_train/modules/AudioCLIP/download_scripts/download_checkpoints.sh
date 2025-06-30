#!/bin/bash
#SBATCH --job-name=audioclip_checkps
#SBATCH --ntasks=1
#SBATCH --time=2:00:00
#SBATCH --output=train/train.out

cd ../assets

wget https://github.com/AndreyGuzhov/AudioCLIP/releases/download/v0.1/AudioCLIP-Full-Training.pt

wget https://github.com/AndreyGuzhov/AudioCLIP/releases/download/v0.1/bpe_simple_vocab_16e6.txt.gz
