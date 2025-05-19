#!/bin/bash

#SBATCH --nodes=1
#SBATCH --mem=64000
#SBATCH --job-name=sfs_tanna
#SBATCH --partition=long
#SBATCH --array=1-29

module purge
module load angsd/0.935-GCC-10.2.0

PATH_INPUT="/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/reports/fst/"
OUTPUT_DIR="${PATH_INPUT}output/"

declare -a pop=("GT" "heron" "huahine" "maupiti" "moorea" "raiatea" "tahiti" "lifou" "LHI" "malekula" "mare" "norfolk" "nz_north" "ouvea" "pentecost" "QLD" "santo" 
"SA" "nz_south" "tanna" "tasmania" "victoria" "WA" "vanua_lava")

 Create output directory
mkdir -p "$OUTPUT_DIR"

 Calculate the index corresponding to the array ID
index=$((SLURM_ARRAY_TASK_ID - 1))

 Iterate through pairs based on the index
for ((i=0; i<${pop[@]}; i++)); do
  for ((j=i+1; j<${pop[@]}; j++)); do
    if [[ $index -eq 0 ]]; then
      pop1="${pop[$i]}"
      pop2="${pop[$j]}"
      realSFS "${PATH_INPUT}${pop1}.saf.idx" "${PATH_INPUT}${pop2}.saf.idx" > "${OUTPUT_DIR}${pop1}.${pop2}.ml"
      break
    else
      index=$((index - 1))
    fi
  done
done
