### Project Proposal: ATAC-Seq Analysis

**Project Title:** ATACseq Individual Project

**Background Information:**
ATAC-seq (Assay for Transposase-Accessible Chromatin using sequencing) is a powerful method used to assess the open chromatin regions across the genome, providing insights into regulatory elements that control gene expression. This project involves the analysis of two ATAC-seq replicates from a human source, which present unique challenges due to the absence of control samples. 

**Objective:**
To conduct a comprehensive analysis of the ATAC-seq data from two human replicates to map accessible chromatin, identify regulatory elements, and analyze transcription factor binding sites and gene enrichment.

**Methods and Workflow:**

1. **Sample Preparation and Quality Control**
   - **Pre-alignment QC:** Use FastQC to assess base quality, GC content, sequence length distribution, and check for sequencing adapters.
   - **Adapter Trimming:** Utilize Trimmomatic for removing adapters and trimming low-quality bases.

2. **Alignment**
   - **Tool:** Bowtie2
   - **Procedure:** Align reads to the human reference genome hg38 using Bowtie2 with the `-X 2000` flag to manage maximum insert size, focusing on achieving a unique mapping rate of over 80%.

3. **Post-Alignment Processing**
   - **Mitochondrial DNA Removal:** Use SAMtools to filter out reads aligning to the mitochondrial genome to reduce noise.
   - **Read Shifting:** Adjust reads using Deeptools to correct for the tagmentation bias, aligning reads more accurately with the transposase cutting sites.

4. **Quality Control Post-Alignment**
   - **Fragment Size Distribution:** Employ ATACSeqQC to analyze and plot fragment distribution sizes to confirm the expected nucleosome patterning of less than 100bp for nucleosome-free regions and around 200bp, 400bp, and 600bp for nucleosome patterns.

5. **Peak Calling**
   - **Tool:** MACS3
   - **Procedure:** Call peaks using default ATAC-seq settings in MACS3. Develop a strategy with Bedtools for defining reproducible peaks across replicates and filter out peaks located in ENCODE blacklisted regions.

6. **Data Analysis and Integration**
   - **Motif Analysis:** Use MEME Suite or HOMER to identify transcription factor binding motifs within the reproducible peaks.
   - **Gene Enrichment Analysis:** Apply tools like GREAT or GSEA to perform enrichment analysis based on the genes associated with identified peaks.

7. **Visualization and Reporting**
   - **Coverage Plots:** Create signal coverage plots centered on TSS for nucleosome-free and nucleosome-bound regions using Deeptools.
   - **Fragment Length Distribution:** Generate plots to display the distribution of fragment lengths for each sample.
   - **Chromatin Accessibility:** Produce figures displaying the proportions of chromatin regions marked as peaks (e.g., Promoter, Intergenic, Intron, Exon).

8. **Deliverables:**
   - Quality control reports and alignment statistics.
   - Tables and plots of fragment length distribution and peak analysis results.
   - A single BED file containing the reproducible peaks identified.
   - Tables and figures summarizing motif and gene enrichment analyses.
   - Figures illustrating the proportions of chromatin accessibility.


**Conclusion:**
This proposal outlines a structured approach to ATAC-seq analysis, from quality control through to advanced genomic analyses, ensuring comprehensive insights into chromatin dynamics and gene regulation. This systematic exploration will leverage cutting-edge bioinformatics tools and techniques to deliver robust and insightful results.


**References:**
Yan, F., Powell, D.R., Curtis, D.J. et al. From reads to insight: a hitchhiker’s guide to ATAC-seq data analysis. Genome Biol 21, 22 (2020). https://doi.org/10.1186/s13059-020-1929-3
Andrews S. Babraham Bioinformatics - FastQC A Quality Control tool for High Throughput Sequence Data. https://www.bioinformatics.babraham.ac.uk/projects/fastqc/   
Ewels P, Magnusson M, Lundin S, Käller M. MultiQC: summarize analysis results for multiple tools and samples in a single report. Bioinformatics. 2016;32:3047–8.
Bolger AM, Lohse M, Usadel B. Trimmomatic: a flexible trimmer for Illumina sequence data. Bioinformatics. 2014;30:2114–20.
Langmead B, Salzberg SL. Fast gapped-read alignment with Bowtie 2. Nat Methods. 2012;9:357–9.
Li H, Handsaker B, Wysoker A, Fennell T, Ruan J, Homer N, et al. The sequence alignment/map format and SAMtools. Bioinformatics. 2009;25:2078–9.
Ramírez, Fidel, Devon P. Ryan, Björn Grüning, Vivek Bhardwaj, Fabian Kilpert, Andreas S. Richter, Steffen Heyne, Friederike Dündar, and Thomas Manke. deepTools2: A next Generation Web Server for Deep-Sequencing Data Analysis. Nucleic Acids Research (2016). doi:10.1093/nar/gkw257.
Zhang et al. Model-based Analysis of ChIP-Seq (MACS). Genome Biol (2008) vol. 9 (9) pp. R137
Aaron R. Quinlan, Ira M. Hall, BEDTools: a flexible suite of utilities for comparing genomic features, Bioinformatics, Volume 26, Issue 6, March 2010, Pages 841–842, https://doi.org/10.1093/bioinformatics/btq033
Heinz S, Benner C, Spann N, Bertolino E et al. Simple Combinations of Lineage-Determining Transcription Factors Prime cis-Regulatory Elements Required for Macrophage and B Cell Identities. Mol Cell 2010 May 28;38(4):576-589. PMID: 20513432
ATACseqQC: a Bioconductor package for post-alignment quality assessment of ATAC-seq data.” BMC Genomics, 19(1), 169. ISSN 1471-2164, doi:10.1186/s12864-018-4559-3, https://doi.org/10.1186/s12864-018-4559-3.



