#!/bin/bash

# Rice Mutant NGS Variant Analysis
# Step 5: Functional annotation using SnpEff

mkdir -p ../results

snpEff Oryza_sativa_IRGSP1-1.0 \
  ../results/rice_mut1.filtered.vcf.gz \
  > ../results/rice_mut1.annotated.vcf

echo "Variant annotation completed."
