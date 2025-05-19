#!/bin/bash
#SBATCH --nodes=1
#SBATCH --clusters=arc
#SBATCH --ntasks-per-node=1
#SBATCH --time=2-10:00:00 
# SBATCH --array=1-33
#SBATCH --job-name=ANGSD_GLs
#SBATCH --partition=long
# SBATCH --output=ANGSD_GLs_%A_%a.log
# SBATCH --error=ANGSD_GLs_%A_%a.error

##################################################################################
#######################

#Load angsd module
ml angsd/0.925-foss-2018b

# Set path to reference assembly and list of bam files (bam.list)
# Note: bam files need to be indexed (using samtools index) 
REF=/data/zool-zost/Ref_Genome/Ref_Genome_PseudoChroms/Zlat_2_Tgut_pseudochromosomes.shortChromNames.fasta.gz
BAMs=resources/path_bam
PATH_INPUT=/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/reports/fasta/

cd $PATH_INPUT

for file in downsampled_*.fa.gz; do
    new_file=$(echo "$file" | sed 's/^downsampled_//')
    mv "$file" "$new_file"
done

mv B3-93_pseudochr.fa.gz B3-93.fa.gz
mv B4-77_pseudochr.fa.gz B4-77.fa.gz
mv full_15-179.fa.gz 15-179.fa.gz

for file in *.fa.gz; do
    sample_name=$(basename "$file" | cut -d "_" -f 1)
    gunzip -c "$file" | sed -e "0,/^>$/{s/^>$/>$sample_name/}" > "${file%.fa.gz}_modified.fa"
done

cat *modified.fa > combined_beagle.fa
