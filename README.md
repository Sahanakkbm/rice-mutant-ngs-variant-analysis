# rice-mutant-ngs-variant-analysis
NGS-based identification and prioritization of candidate functional mutations in a rice mutant.


## Project Overview

This project demonstrates a whole-genome NGS bioinformatics workflow used to identify and prioritize candidate functional mutations in a rice mutant.

The analysis starts from raw sequencing reads and proceeds through quality control, read processing, reference alignment, variant calling, functional annotation, candidate prioritization, and read-level validation.

## Research Question

Can whole-genome sequencing data be used to identify high-impact candidate mutations that may contribute to the phenotype of a rice mutant?

## Workflow

FASTQ  
↓  
Quality Control  
↓  
Read Processing  
↓  
Reference Alignment  
↓  
SAM/BAM Processing  
↓  
Variant Calling  
↓  
Variant Filtering  
↓  
Functional Annotation  
↓  
High-Impact Variant Screening  
↓  
Candidate Prioritization  
↓  
Read-Level Validation

## Tools Used

- FastQC
- fastp
- BWA
- SAMtools
- bcftools
- SnpEff
- Bash/Linux
- Ensembl resources

## Key Results

The analysis identified high-impact candidate variants including:

- Stop-gained variants
- Stop-lost variants
- Start-lost/splice-region variants
- Candidate mutations predicted to cause protein truncation

Candidate variants were further prioritized using predicted mutation position within the protein and available read-level evidence.

## Candidate Prioritization

Examples of prioritized candidates include:

| Gene | Protein change | Protein length |
|---|---|---:|
| Os03g0285700 (OsAPX1) | p.Lys30* | 250 aa |
| Os01g0937050 (OsCLP) | p.Cys80* | 424 aa |
| Os03g0202500 (OsFbox132) | p.Leu242* | 510 aa |

These candidates represent potential functional mutations for further investigation.

## Read-Level Validation

Selected candidate positions were examined using SAMtools-based read-level analysis to determine whether sequencing reads supported the identified alternate allele.

## Interpretation

The workflow demonstrates how NGS data can be transformed from raw sequencing reads into biologically interpretable candidate variants.

The identified variants should be considered **candidate mutations rather than confirmed causal mutations**, since experimental validation would be required to establish a direct relationship with the mutant phenotype.

## Limitations

- Variant prioritization is computational and does not establish causality.
- Experimental validation was not performed as part of this analysis.
- Functional consequences are based on computational annotation and predicted protein effects.

## Future Work

Future analysis could include:

- Literature-based functional investigation of prioritized genes
- Additional variant filtering and validation
- Comparison with wild-type/reference samples
- Experimental validation of selected candidate genes

## Repository Contents

- `results/` — processed variant and candidate tables
- `workflow/` — analysis scripts
- `figures/` — project visualizations
- `documentation/` — methodology and interpretation

---

### Project Status

**Computational analysis completed; candidate interpretation and documentation in progress.**
