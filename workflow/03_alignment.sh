#!/bin/bash

# Rice Mutant NGS Variant Analysis
# Step 3: Reference genome alignment

bwa mem \
  ../reference/Oryza_sativa.IRGSP-1.0.dna.toplevel.fa \
  ../trimmed/rice_mut1_trimmed.fastq.gz \
  > ../alignment/rice_mut1.sam

echo "BWA alignment completed."