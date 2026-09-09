#!/bin/bash

# Rice Mutant NGS Variant Analysis
# Step 3: Reference genome alignment and BAM processing

mkdir -p ../alignment

bwa mem \
  ../reference/Oryza_sativa.IRGSP-1.0.dna.toplevel.fa \
  ../trimmed/rice_mut1_trimmed.fastq.gz \
  > ../alignment/rice_mut1.sam

samtools view -b \
  ../alignment/rice_mut1.sam \
  > ../alignment/rice_mut1.bam

samtools sort \
  -o ../alignment/rice_mut1.coordinate_sorted.bam \
  ../alignment/rice_mut1.bam

samtools index \
  ../alignment/rice_mut1.coordinate_sorted.bam

echo "Alignment and BAM processing completed."
