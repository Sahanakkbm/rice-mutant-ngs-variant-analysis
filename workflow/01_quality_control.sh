#!/bin/bash

# Rice Mutant NGS Variant Analysis
# Step 1: Quality Control

mkdir -p ../qc

fastqc ../raw_data/rice_mut1.fq.gz \
  --outdir ../qc

echo "Quality control completed."
