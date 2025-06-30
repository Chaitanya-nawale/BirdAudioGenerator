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
python3 inference_stable.py --prompt "A beautiful landscape of a river with a snow storm" --seed 48 --title "river_edited" --num_images_per_prompt 1 --guidance_scale 7.0 --editing_prompt "['oil painting', 'drawing', 'watch tower']" --reverse_editing_direction "[False,False,False]" --edit_warmup_steps "[20,10,11]" --edit_guidance_scale "[2000,2000,2000]" --edit_threshold "[-0.2,-0.1,-0.1]" --edit_weights "[1.2,1,1]" --edit_momentum_scale 0.25 --edit_mom_beta 0.6
