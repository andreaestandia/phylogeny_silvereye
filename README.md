# Islands promote diversification within the silvereye clade: a phylogenomic analysis of a great speciator

This repository contains the full pipeline used in *Estandía et al. (2025) Islands promote diversification within the silvereye clade: a phylogenomic analysis of a great speciator. Molecular Ecology*. The project explores the importance of geographical context in the emergence of great speciators, in particular in the silvereyes (*Zosterops lateralis*), using whole-genome sequencing and phylogenomic tools.

## Overview
The study applies a combination of phylogenetic inference, population genomic statistics, and Bayesian modelling to uncover the genomic signatures and evolutionary processes associated with rapid speciation in island environments.

## Repository Structure
`pipeline`
This folder contains the shell scripts that make up the main bioinformatics pipeline used to process genomic data, infer phylogenies, and analyse population structure.

Pipeline steps:

* `0_rawreads2sortedbams.sh`     # Preprocessing: raw reads to sorted BAMs
* `1_downsample_bams.sh`         # Downsampling BAM files
* `2_create_outgroup.sh`         # Defining outgroup samples (*Zosterops borbonicus*)
* `3_genotype_likelihoods.sh`    # Generating genotype likelihoods (ANGSD)
* `4_bam2fasta.sh`               # BAM to FASTA conversion
* `5_formatfasta.sh `            # FASTA formatting for phylogenetics
* `7_selection.sh`               # Selection scans
* `8_prune_beagle.sh`            # Remove SNPs with low genotype likelihood i.e. call certain genotypes
* `9_convert2vcf.sh`             # VCF conversion from genotype likelihood
* `10_prep_snap.sh`              # Preparing input for the SNAP analysis
* `11_prep_raxml.sh`             # RAxML input prep
* `12_run_raxml.sh`              # Final RAxML runs
* `13_run_iqtree.sh`             # IQ-TREE phylogeny construction
* `14_neutral_pca.sh`            # PCA on putatively neutral regions
* `15_treemix.sh`                # Treemix analysis for population splits/migration
* `16_subset_pops_fst.sh`       # Subsetting for F<sub>ST</sub> analyses
* `17_calculate_saf.sh`          # Site allele frequency calculation
* `18_calculate_sfs.sh`          # Site frequency spectrum
* `19_fst_parallel.sh`           # Pairwise F<sub>ST</sub> computation in parallel

We have run the pipeline on a Unix-based system with a job scheduler (SLURM) for parallel computation steps.

## Contact
For questions or feedback, please contact Andrea Estandía (`andrea.estandia@biology.ox.ac.uk`)
