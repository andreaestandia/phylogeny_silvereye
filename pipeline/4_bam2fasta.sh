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
PATH_OUT=/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/reports/fasta/

# Use slurm array task ID to get long chromosome name
CHROM=$(cat resources/chrom.list | head -n 1 | tail -n 1)

while IFS= read -r line; do
    file_name=$(basename "$line")
    part=$(echo "$file_name" | awk -F. '{print $1}')
    angsd -i $line -ref $REF -doFasta 3 -out "${PATH_OUT}${part}"\
    -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -baq 1 -minMapQ 20 -minQ 20 
done < $BAMs

