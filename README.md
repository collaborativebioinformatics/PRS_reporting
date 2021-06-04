# Expression and SNPs to clinic
Smooth transition of called variants from RNAseq/DNAseq and expression to the clinic. 

## Contributors 
- Yue Yang - Lead 
- Annie Nadkarni - Writer, Tech support 
- Poojalakshmi Sreedhar - Liaison 
- ChunHsuan LO - Writer, Tech support 
- David Enoma - Tech support 
- Alex Guo - SysAdmin

## Goal 
Our goal is to calculate disease-specific patient-level PRS based on GWAS summary statistics for different disease. 

## Introduction 
Polygenic risk score (PRS) is a widely used method to model how the collective effect of many SNPs contributes to a phenotype. With the observance that Polygenic complex traits are associated with many SNPs, PRS is a powerful approach to associate individual genotype information to phenotype information. 

PRS can be used to quantify the probability that an individual could potentially develop the disease status given the genotype data, which makes it possible for its application in clinical prognosis and genetic testing. With the GWAS summary statistics of many complex traits available, polygenic risk scores are easily calculated given individual variant calling data. 

In this manuscript, we built a pipeline consisting of GWAS summary statistics downloading, PRS scores computing, predictive model construction, and visualization. This analysis flow can be leveraged to various clinical outcomes and potentially be used in clinical prognosis or genetic testing.

## Input:

- GWAS summary statistics
- Genotype data
- Phenotype

## Outputs: 

- Patient-level: 
  - PRS scores (.csv)

- Cohort-level:
  - Predictive model (.sav)
  - Probability of being affected by the disease (.csv + visualization)
  - Importance of each feature(PRS) in the phenotype  - - prediction (.csv + visualization)
    
## Methods 

I. Data Acquisition and Preprocessing:

1. Download the GWAS summary statistics from GWAS Atlas

2. Edit the headers to be consistent with the nomenclature established by PRSice

3. Filter out irrelevant features

II. PRS Score Calculation:

1. Match the summary statistics and the variants called in the genotype data

2. Select variants by different clumping thresholds

3. Calculate the PRS scores using beta value of summary statistics accordingly

III. Clinical Outcome Prediction

1. Randomly generate phenotype labels for each of the sample

2. Train a random forest classifier to predict the clinical outcome based on the calculated cohort PRS scores, save the trained model

3. Predicts the probability of an individual being affected by the disease based on their PRS scores, as well as the impurity-based feature (each PRS score) importances to the prediction

4. Visualizes the disease probability and PRS score importances for explainability

## Installation 
Please use the DNAnexus workflows for PRS Computing and Phenotype Predictions to use this tool. 

## Flowchart
<img width="448" alt="flowchart" src="https://github.com/collaborativebioinformatics/PRS_reporting/raw/main/work_flowchart.jpg">
(for the working pipelines)

## Use Cases

- Example input: plink BED files/ clinical outcome for individuals accordingly
- Example output: PRS scores for individuals/ outcome prediction model using PRS scores/ outcome prediction model

<img width="448" alt="feature importance" src="https://github.com/collaborativebioinformatics/PRS_reporting/raw/main/feature_importance.jpeg">
Visualization of the importance of each PRS score to the prediction

<img width="448" alt="disease probability" src="https://github.com/collaborativebioinformatics/PRS_reporting/raw/main/disease_probability.jpeg">
Visualization of the probability of each sample being affected by the disease

## References 

- Data source: https://www.ukbiobank.ac.uk/
- GATK Best Practices: https://gatk.broadinstitute.org/hc/en-us/sections/360007226651-Best-Practices-Workflows 
- DSeq2: https://bioconductor.org/packages/release/bioc/html/DESeq2.html 
- DNANexus documentation: https://documentation.dnanexus.com/developer/apps/execution-environment/connecting-to-jobs
- bigsnpR: https://cran.rstudio.com/web/packages/bigsnpr/bigsnpr.pdf
- Scikit-learn: https://scikit-learn.org/stable/
