#!/bin/bash
eval "$(conda shell.bash hook)"
conda activate stainedglass
cd ~/StainedGlass/
for file in \
  ~/StainedGlass/data/Rca2_R5.fa 
do
  samtools faidx "$file"
  filename=$(basename "$file")
  snakemake --use-conda --cores all --config sample="${filename%.*}" fasta="$file"
  snakemake --use-conda --cores all make_figures --config sample="${filename%.*}" fasta="$file"
done
