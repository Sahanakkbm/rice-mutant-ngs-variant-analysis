#!/bin/bash

# Rice Mutant NGS Variant Analysis
# Step 5: Variant annotation

mkdir -p ../variants

snpEff Oryza_sativa.IRGSP-1.0 \
  ../variants/rice_mut1.vcf.gz \
  > ../variants/rice_mut1_annotated.vcf

echo "Variant annotation completed."
