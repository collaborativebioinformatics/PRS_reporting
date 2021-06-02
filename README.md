# PRS_reporting
Clinical Reporting of Polygenic Risk Scores

###
Imputed gene expression by using GTEx data and then compute PRS & predict disease states

Potential Todo:
  Compute PRS based on various p-value thresholds and GWAS summary statistics
  Build a predictive model using generated PRS scores if clinical outcomes available (synthetic data UKB synthetic data, synthetic phenotypes)

Goal: Predict Gene-level PRS

Explainable ML (SHAP): What factors in Genome contribute to PRS and 
  Bootstraping ()
  If loci removed, how PRS could change accordingly
  Allele frequency/ LD structure/ effect size

Explainable ML: 
  Visualization (custom scripts from Nick! Ask him!)
  Input: GWAS summary statistics; individual genotype variant data (vcf/ plink bed/ ...), disease phenotype?
  Output: 1. PRS scores; 2. Predictive model 3. Some visualizations

Notes from meeting with Sal and Ahmad.
What is the model output?  Related likelihood? Some more clear output information(scores, images, pdf)
How are these information given to the other team?(database)
How do we associate the phenotype and PRS? (can customize it based on gene information, probability for other disease, sample selection for clinical trials), Link to our github. 
###
