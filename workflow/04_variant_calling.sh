#!/bin/bash

# Rice Mutant NGS Variant Analysis
# Step 4: Variant calling from coordinate-sorted BAM

mkdir -p ../results

bcftools mpileup \
  -f ../reference/Oryza_sativa.IRGSP-1.0.dna.toplevel.fa \
  ../alignment/rice_mut1.coordinate_sorted.bam \
  -Ou | \
bcftools call \
  -mv \
  -Oz \
  -o ../results/rice_mut1.raw.vcf.gz

bcftools index ../results/rice_mut1.raw.vcf.gz

echo "Variant calling completed."
