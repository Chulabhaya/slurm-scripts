#!/bin/bash

# --- Set up Slurm settings
#SBATCH --partition=gpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --partition=gpu
#SBATCH --gres=gpu:v100-sxm2:1
#SBATCH --mem=4GB
#SBATCH --time=00:10:00

# --- Load modules
module load cuda/11.7

# --- Set up Conda environment
source /work/llpr/wijesundara.c/miniconda3/bin/activate
conda activate rl

# --- Run code
python test.py --seed $1 --exp-name $2