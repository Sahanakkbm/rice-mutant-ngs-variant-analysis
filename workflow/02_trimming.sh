#!/bin/bash

# Rice Mutant NGS Variant Analysis
# Step 2: Read trimming and filtering

mkdir -p ../trimmed ../results

fastp \
  -i ../raw_data/rice_mut1.fq.gz \
  -o ../trimmed/rice_mut1_trimmed.fastq.gz \
  -h ../results/rice_mut1_fastp.html \
  -j ../results/rice_mut1_fastp.json

echo "Read trimming completed."
