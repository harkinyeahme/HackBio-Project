#!/bin/bash
# This script performs quality trimming and filtering of paired-end FASTQ files 
# using fastp. It processes multiple samples in a loop.

# Define an array of sample names (without _R1/_R2.fastq.gz suffixes)
SAMPLES=(
        "ACBarrie"
        "Alsen"
        "Baxter"
        "Chara"
        "Drysdale"
        )

# Create an output directory for trimmed reads (if it does not exist)
mkdir -p trimmed_reads

# Loop through each sample name in the list
for SAMPLE in "${SAMPLES[@]}"; do
    echo "[INFO] Processing sample: $SAMPLE"

    # Run fastp for paired-end read trimming and filtering
    fastp \
        -i "$PWD/${SAMPLE}_R1.fastq.gz" \      # Input forward reads
        -I "$PWD/${SAMPLE}_R2.fastq.gz" \      # Input reverse reads
        -o "trimmed_reads/${SAMPLE}_R1.fastq.gz" \  # Output trimmed forward reads
        -O "trimmed_reads/${SAMPLE}_R2.fastq.gz" \  # Output
