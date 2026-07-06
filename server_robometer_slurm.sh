#!/bin/bash

#SBATCH -J server_robometer_test
#SBATCH -t 5:00
#SBATCH --partition=gpu_a100
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH --gpus-per-node=1
#SBATCH --output=%x_%j.log

module load 2025
module load FFmpeg/7.1.1-GCCcore-14.2.0

# move to robometer dr 
cd $HOME/robometer

# actually run the thing
uv run python robometer/evals/eval_server.py \
    model_path=robometer/Robometer-4B \
    server_url=127.0.0.1 \
    server_port=5000