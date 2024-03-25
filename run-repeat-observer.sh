#!/bin/bash
eval "$(conda shell.bash hook)"
conda activate repeatobserver
cd ~/repeatobserver
./Setup_Run_Repeats.sh -i SpeciesName -f Reference_Genome.fasta -h H0 -c 8 -m 12800 -g FALSE
