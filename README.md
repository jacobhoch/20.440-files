Overview
- This repo contains RNA expression data from Drosophila ovaries at 3 days, as well as some preliminary analysis of one gene over the psuedotime estabilished by the data creators.

Data
- Data generated through Single-Cell 3' Library & Gel Bead Kit v2, with library quantification performed with 2100 Bioanalyzer Instrument (Agilgent Technologies) and sequenced with NovaSeq 6000 (Illumina)
- Source: Jevitt A, Chatterjee D, Xie F, Wang XF, Otwell T, Huang YC, Deng WM. "A single-cell atlas of adult Drosophila ovary identifies transcriptional programs and somatic cell lineage regulating oogenesis." Plos Biology, 27 Apr 2020, 18(4):e30000538

Folder Structure
- "440_project": contains files for the project
    -> "data": contains data files
    -> "code": contains R code for generating figure
    -> "figures": contains image for figure

Installation
- Code runs in R with packages ggplot2, VGAM, stats4, splines, DDRTree, irlba, loomR
- R script expects "GSM4363298_1666cells_symmetrybreaking_trajectory.rds.gz" file to be pushed to global environment as "test"