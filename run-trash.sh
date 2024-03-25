#!/bin/bash
eval "$(conda shell.bash hook)"
conda activate trash
cd ~/TRASH
mkdir -p results
./TRASH_run.sh file.fa ~/TRASH/results/
