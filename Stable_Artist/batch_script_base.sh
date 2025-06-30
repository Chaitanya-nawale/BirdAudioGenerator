#!/usr/bin/zsh

### Job Parameters
#SBATCH --account=lect0151 
#SBATCH --partition=c23g
#SBATCH --ntasks=1
#SBATCH -J gpu_serial
#SBATCH -o gpu_serial.%J.log
#SBATCH --gres=gpu:1 
#SBATCH --time=00:15:00 # Run time of 15 minutes
#SBATCH --output=stable_run_%j.log

module load CUDA/12.6.3 

### Activate virtual environment
source stable/bin/activate

### Program Code
python3 base_stable.py --prompt "A beautiful landscape of a river with a snow storm" --seed 48 --title "river_snowstorm" --num_images_per_prompt 1 --guidance_scale 7.0 

echo "SLURM job ran successfully on $(hostname)"