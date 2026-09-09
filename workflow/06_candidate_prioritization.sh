#!/bin/bash

# Rice Mutant NGS Variant Analysis
# Step 6: Candidate prioritization
#
# High-impact variants were prioritized using:
# 1. Predicted functional effect
# 2. Protein length
# 3. Mutation position within the protein
# 4. Mutation position fraction
#
# Protein lengths were retrieved from Ensembl REST API.

mkdir -p ../results

python3 - <<'PY'
import csv
import json
import subprocess
import re
import time

input_file = "../results/high_impact_candidates_clean.tsv"
output_file = "../results/candidates_with_protein_length.tsv"

with open(input_file) as f:
    rows = list(csv.DictReader(f, delimiter="\t"))

with open(output_file, "w", newline="") as out:
    fields = list(rows[0].keys()) + [
        "Protein_length",
        "Mutation_position",
        "Mutation_fraction"
    ]

    writer = csv.DictWriter(
        out,
        fieldnames=fields,
        delimiter="\t"
    )

    writer.writeheader()

    for i, row in enumerate(rows, 1):
        gene = row["Gene_ID"]

        try:
            url = f"https://rest.ensembl.org/lookup/id/{gene}?expand=1"

            result = subprocess.run(
                [
                    "curl", "-s", "-L", url,
                    "-H", "Content-Type: application/json"
                ],
                capture_output=True,
                text=True
            )

            data = json.loads(result.stdout)

            protein_length = "NA"

            for transcript in data.get("Transcript", []):
                if transcript.get("is_canonical"):
                    translation = transcript.get("Translation")

                    if translation:
                        protein_length = translation.get(
                            "length", "NA"
                        )
                    break

            protein_change = row["Protein_change"]

            match = re.search(
                r'[A-Za-z]+\s*(\d+)',
                protein_change
            )

            mutation_position = (
                match.group(1) if match else "NA"
            )

            if (
                protein_length != "NA"
                and mutation_position != "NA"
            ):
                fraction = (
                    float(mutation_position)
                    / float(protein_length)
                )
            else:
                fraction = "NA"

            row["Protein_length"] = protein_length
            row["Mutation_position"] = mutation_position
            row["Mutation_fraction"] = fraction

        except Exception:
            row["Protein_length"] = "NA"
            row["Mutation_position"] = "NA"
            row["Mutation_fraction"] = "NA"

        writer.writerow(row)
        time.sleep(0.1)

print("Candidate prioritization completed.")
print("Output:", output_file)
PY

echo "Candidate prioritization completed."
