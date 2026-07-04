# Testing_Robotmeter

This repo is to hold and transfer various job submission scripts to the snellius cluster.

The plain `uv python` commands can be extracted from the slurm scrips if necessary.

The script sets up and runs the Robometer RL task completion judging software.
This is so I can test it before deploying it to the cluster at UvA.

Files and what they do:
`setup_robometer_before_job.sh`: a bash script that should run before any other to download robometer and setup the model for use.

`robometer_slurm.sh`: a slurm job submission script to run local inference. This confirms that robometer is working and can perform inference.

`server_robometer_slurm.sh`: a slurm job submisison script that runs the server side of robometer. It does not provide results on its own, but it does run on `127.0.0.1:5000`.

`client_robometer_slurm.sh`: a slurm job submission script that runs the client side of robomeer. It sends a request to the server running robometer at `127.0.0.1:5000` for the brown stick in bowl task.