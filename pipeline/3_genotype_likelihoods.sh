#!/bin/bash
#SBATCH --nodes=1
#SBATCH --clusters=arc
#SBATCH --ntasks-per-node=1
#SBATCH --time=2-10:00:00 
#SBATCH --array=1-33
#SBATCH --job-name=ANGSD_GLs
#SBATCH --partition=long
#SBATCH --output=ANGSD_GLs_%A_%a.log
#SBATCH --error=ANGSD_GLs_%A_%a.error
#SBATCH --mail-type=ALL

##################################################################################
#######################

#Load angsd module
ml angsd/0.925-foss-2018b

# Set path to reference assembly and list of bam files (bam.list)
# Note: bam files need to be indexed (using samtools index) 
REF=/data/zool-zost/Ref_Genome/Ref_Genome_PseudoChroms/Zlat_2_Tgut_pseudochromosomes.shortChromNames.fasta.gz
BAMs=resources/path_bam
PATH_OUT=/data/zool-zost/sjoh4959/projects/0.0_phylo_silvereye/reports/genotype_likelihoods/

# Use slurm array task ID to get long chromosome name
CHROM=$(cat resources/chrom.list | head -n $SLURM_ARRAY_TASK_ID | tail -n 1)

# Estimate genotype likelihoods and output SNPs using ANGSD
angsd -b $BAMs -ref $REF \
-uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -baq 1 -minMapQ 20 -minQ 20 \
-GL 1 -doMajorMinor 1 -doMaf 1 -doPost 2 -doGlf 2 \
-minMaf 0.05 -SNP_pval 1e-6 -skipTriallelic \
-r $CHROM -out "${PATH_OUT}${CHROM}"

