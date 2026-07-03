#!/bin/bash

#SBATCH -J test_robometer
#SBATCH -t 5:00
#SBATCH --partition=gpu_a100
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH --gpus-per-node=1
#SBATCH --output=%x_%j.log

module load 2025
# module load CUDA/12.9.1
module load FFmpeg/7.1.1-GCCcore-14.2.0

# move to robometer dr 
cd $HOME/robometer_setup/robometer

uv sync

# actually run the thing
uv run python scripts/example_inference_local.py \
  --model-path robometer/Robometer-4B \
  --video scripts/example_videos/soar_put_green_stick_in_brown_bowl.mp4 \
  --task "put green stick in brown bowl"
