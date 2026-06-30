#!/bin/bash

#SBATCH -J test_robometer
#SBATCH -t 5:00
#SBATCH --partition=gpu_a100
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH --gpus-per-node=1
#SBATCH --output=%x_%j.log

module load 2025
module load CUDA/12.9.1
module load FFmpeg/7.1.1-GCCcore-14.2.0

# move to robometer dr 
cd $HOME/robometer_setup/robometer

uv sync --extra robometer

# test
uv run python -c "from transformers import Qwen3VLModel; print(Qwen3VLModel)"

# actually run the thing
# uv run python scripts/example_inference_local.py \
#   --model-path robometer/Robometer-4B \
#   --video scripts/example_videos/soar_put_green_stick_in_brown_bowl.mp4 \
#   --task "put green stick in brown bowl"


# # setup the output
# RUN_NAME=$(date +%Y%m%d_%H%M)_${SLURM_JOB_ID}
# UNIQUE_RUN_DIR="$TMPDIR/$RUN_NAME"
# mkdir -p "$UNIQUE_RUN_DIR"

# # move the output back to home when done
# cp -r "$UNIQUE_RUN_DIR" $HOME
