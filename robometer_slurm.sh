#!/bin/bash

#SBATCH -J test_robometer
#SBATCH -t 20:00
#SBATCH --partition=gpu_a100
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH --gpus-per-node=1
#SBATCH --output=%x_%j.log

module load 2025
module load CUDA/12.9.1
module load Python/3.13.5-GCCcore-14.3.0

# setup
pip install uv
pip install -U "huggingface_hub"
export HF_TOKEN=$(cat ~/.hf_token)

# move to scratch 
cd $TMPDIR

git clone https://github.com/robometer/robometer.git
cd robometer

# Create venv and install
uv sync

# actually run the thing
uv run python scripts/example_inference_local.py \
  --model-path robometer/Robometer-4B \
  --video scripts/example_videos/soar_put_green_stick_in_brown_bowl.mp4 \
  --task "test task description"


# # setup the output
# RUN_NAME=$(date +%Y%m%d_%H%M)_${SLURM_JOB_ID}
# UNIQUE_RUN_DIR="$TMPDIR/$RUN_NAME"
# mkdir -p "$UNIQUE_RUN_DIR"

# # move the output back to home when done
# cp -r "$UNIQUE_RUN_DIR" $HOME
