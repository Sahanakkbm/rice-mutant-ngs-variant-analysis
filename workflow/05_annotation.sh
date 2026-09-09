#!/bin/bash

# Rice Mutant NGS Variant Analysis
# Step 5: Variant filtering and functional annotation

mkdir -p ../results

bcftools view \
  -i 'QUAL>=30 && INFO/DP>=5' \
  ../results/rice_mut1.raw.vcf.gz \
  -Oz \
  -o ../results/rice_mut1.filtered.vcf.gz

bcftools index ../results/rice_mut1.filtered.vcf.gz

snpEff Oryza_sativa_IRGSP1 \
  ../results/rice_mut1.filtered.vcf.gz \
  > ../results/rice_mut1.annotated.vcf

echo "Variant filtering and functional annotation completed."
