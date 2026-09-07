# Rice Mutant NGS Variant Analysis

NGS-based identification and prioritization of candidate functional mutations in a rice mutant.

## Project Overview

This project demonstrates a whole-genome NGS bioinformatics workflow used to identify and prioritize candidate functional mutations in a rice mutant.

The analysis starts from raw sequencing reads and proceeds through quality control, read processing, reference alignment, SAM/BAM processing, variant calling, variant filtering, functional annotation, high-impact variant screening, candidate prioritization, and read-level validation.

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
- SnpEff 5.2f
- Bash/Linux
- Ensembl REST resources

### Reference and Annotation

- Reference genome: *Oryza sativa* IRGSP-1.0
- SnpEff database: `Oryza_sativa_IRGSP1`

## Variant Filtering

Variants were filtered using the following criteria:

- QUAL ≥ 30
- INFO/DP ≥ 5

The filtered variants were subsequently annotated using SnpEff with the `Oryza_sativa_IRGSP1` database.

## High-Impact Variant Screening

Following functional annotation, variants with predicted high-impact effects were extracted for further investigation.

The screening included variants annotated as:

- `stop_gained`
- `stop_lost`
- `start_lost`
- splice-region-associated high-impact variants

## Key Results

The analysis identified **40 high-impact candidate variants**, including:

- 34 stop-gained variants
- 4 stop-lost variants
- 2 variants involving start-lost/splice-region effects

Candidate variants were further prioritized using predicted mutation position within the protein, protein length, and read-level evidence.

## Candidate Prioritization

Candidate variants were prioritized using protein-level information obtained from Ensembl resources.

The analysis calculated the position of the predicted mutation relative to the total protein length for variants where this information was available.

Examples of prioritized candidates include:

| Gene | Protein change | Protein length |
|---|---|---:|
| Os03g0285700 (OsAPX1) | p.Lys30* | 250 aa |
| Os01g0937050 (OsCLP) | p.Cys80* | 424 aa |
| Os03g0202500 (OsFbox132) | p.Leu242* | 510 aa |

These candidates represent potential functional mutations selected for further investigation and do not by themselves establish causality.

## Read-Level Validation

Selected candidate positions were examined using SAMtools-based read-level analysis to determine whether sequencing reads supported the identified alternate allele.

Read-level inspection included examination of:

- Read depth
- Alternate allele support
- Genotype
- Allele depth
- Local alignment evidence

This provided an additional check that selected candidate variants were supported by the sequencing data.

## Interpretation

The workflow demonstrates how whole-genome NGS data can be transformed from raw sequencing reads into biologically interpretable candidate variants.

High-impact variants can provide useful candidates for investigating the genetic basis of a mutant phenotype. However, computational prediction and read-level support alone cannot establish that a variant is responsible for the observed phenotype.

The identified variants should therefore be considered **candidate mutations rather than confirmed causal mutations**.

## Limitations

- Variant prioritization is computational and does not establish causality.
- Experimental validation was not performed as part of this analysis.
- Functional consequences are based primarily on computational annotation and predicted protein effects.
- A matched wild-type/control dataset was not included in the current analysis.
- Candidate variants require additional biological and experimental evidence before being considered causal.

## Future Work

Future analysis could include:

- Literature-based functional investigation of prioritized genes
- Comparison with wild-type/reference sequencing data
- Additional variant filtering and validation
- Gene and protein functional analysis
- Pathway-level investigation of prioritized genes
- Experimental validation of selected candidate genes
- Independent validation of promising variants using targeted sequencing or other molecular approaches

## Repository Contents

- `results/` — processed variant and candidate tables
- `workflow/` — analysis scripts
- `figures/` — project visualizations
- `README.md` — project overview, methodology, results, and interpretation

## Project Status

**Computational analysis completed; candidate interpretation and documentation in progress.**
