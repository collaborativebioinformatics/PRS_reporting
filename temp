# Expression and SNPs to clinic
Smooth transition of called variants from RNAseq/DNAseq and expression to the clinic. 

## Contributors 
- Yue Yang - Sysadmin 
- Annie Nadkarni - Writer, Tech support 
- Poojalakshmi Sreedhar - Tech support 
- ChunHsuan LO - Writer, Tech support 
- David Enoma - Tech support 
- Alex GUO - Liaison 

## Goal 
Our goal is to calculate disease-specific patient-level PRS based on GWAS summary statistics for different disease. 

## Introduction 
- Input preparation:
  Select traits & Download GWAS ssumary statistics from GWAS catlog (prepare GWAS summary statistics to be in the same form)
  Prepare UKB synthetic genotype/ phenotype data

- (Individual-level) Compute PRS:
	  Compute PRS based on various p-value thresholds and GWAS summary statistics

- (Cohort-level) Build predictive models:
    Build a predictive model using generated PRS scores on UKB synthetic data

## Methods
-Input:
  GWAS summary statistics
  Genotype data
  Phenotype

-We identified synthetic UK Biobank data as Genotype/ Phenotype data input.

-Output: 
  Patient-level: 
    PRS scores
  Cohort-level:
    Predictive model
    Some visualizations

## Installation 

## Flowchart
<img width="448" alt="flowchart" src="##">
Flowchart of the pipeline

## Results 

## notes
-Feedback from UX team
  What is the model output?  Related likelihood? Some more clear output information(scores, images, pdf)
  How are these information given to the other team?(database) database, model
  How do we associate the phenotype and PRS? (can customize it based on gene information, probability for other disease, sample selection for clinical trials), Link to our github. build predictive models


## References 

- Data: 
- GATK Best Practices https://gatk.broadinstitute.org/hc/en-us/sections/360007226651-Best-Practices-Workflows 
- DSeq2 https://bioconductor.org/packages/release/bioc/html/DESeq2.html 
- DNANexus documentation https://documentation.dnanexus.com/developer/apps/execution-environment/connecting-to-jobs 
