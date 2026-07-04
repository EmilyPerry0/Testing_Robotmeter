#!/bin/bash

cd $HOME
git clone https://github.com/robometer/robometer.git
cd robometer
uv sync
hf download robometer/Robometer-4B --local-dir models
sed -i 's/use_unsloth: *true/use_unsloth: false/' models/config.yaml