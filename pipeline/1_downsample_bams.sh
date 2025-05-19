#!/bin/bash
#SBATCH --clusters=arc
#SBATCH --array=1-6:1
#SBATCH --time=10:00:00 
#SBATCH --job-name=downsampleBams
#SBATCH --partition=long
#SBATCH --output=downsampleBams_%a.log
#SBATCH --error=downsampleBams_%a.error

#Load required modules
module load SAMtools/1.16.1-GCC-11.3.0

#Set path to sample info and chrom list 
PATH_BAM=/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/analysis/resources/downsample_bams
SAMPLE_BAM=$(head -n $SLURM_ARRAY_TASK_ID $PATH_BAM | tail -n 1)
SAMPLE_BAM_BASE=$(basename $SAMPLE_BAM)

#Calculate average read depth across bam file (rounded to nearest whole value)
DEPTH=$(samtools depth $SAMPLE_BAM | awk 'BEGIN{s=0;}{s=s+$3;}END{printf("%.0f\n", s/NR);}')

#Calculate proportion of reads required to achieve desired depth
DESIRED_DEPTH=5
PROP=$(echo "scale=2; $DESIRED_DEPTH / $DEPTH" | bc)

#Downsample bam file using samtools
samtools view -bs 42${PROP} $SAMPLE_BAM > downsampled_${SAMPLE_BAM_BASE}

#Index the downsampled bam file
samtools index downsampled_${SAMPLE_BAM_BASE}

