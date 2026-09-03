#!/bin/bash

# Rice Mutant NGS Variant Analysis
# Step 4: Variant calling

bcftools mpileup \
  -f ../reference/Oryza_sativa.IRGSP-1.0.dna.toplevel.fa \
  ../alignment/rice_mut1.coordinate_sorted.bam \
  -Ou | \
bcftools call \
  -mv \
  -Oz \
  -o ../variants/rice_mut1.vcf.gz

bcftools index ../variants/rice_mut1.vcf.gz

echo "Variant calling completed."