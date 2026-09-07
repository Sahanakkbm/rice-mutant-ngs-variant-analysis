#!/bin/bash

# Rice Mutant NGS Variant Analysis
# Step 5: Variant filtering using bcftools

mkdir -p ../results

bcftools view \
  -i 'QUAL>=30 && INFO/DP>=5' \
  ../results/rice_mut1.raw.vcf.gz \
  -Oz \
  -o ../results/rice_mut1.filtered.vcf.gz

bcftools index ../results/rice_mut1.filtered.vcf.gz

echo "Variant filtering completed."
