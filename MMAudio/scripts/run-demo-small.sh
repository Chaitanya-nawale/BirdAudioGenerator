#!/usr/bin/zsh

### Job Parameters
#SBATCH --account=lect0151
#SBATCH --partition=c23g
#SBATCH --ntasks=1
#SBATCH -J gpu_serial
#SBATCH -o gpu_serial.%J.log
#SBATCH --gres=gpu:1
#SBATCH --time=00:15:00 # Run time of 15 minutes
#SBATCH --output=mmaudio_run_%j.log
#SBATCH --mem-per-gpu=48G

### Activate virtual environment
source .venv/bin/activate

python3 demo.py \
    --duration 8 \
    --video "examples/F8Zt3mYlOqU_000094.mp4" \
    --prompt "whales in ocean" \
    --variant "small_16k" \
    
