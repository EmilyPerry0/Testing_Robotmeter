#!/bin/bash

#SBATCH -J client_robometer_test
#SBATCH -t 5:00
#SBATCH --output=%x_%j.log

module load 2025

# move to robometer dr 
cd $HOME/robometer

# actually run the thing
uv run python scripts/example_inference.py \
    --eval-server-url http://127.0.0.1:5000 \
    --video scripts/example_videos/soar_put_green_stick_in_brown_bowl.mp4 \
    --task "pick up green stick and put green stick in brown bowl" \
    --fps 5