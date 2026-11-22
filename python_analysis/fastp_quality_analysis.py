import json
from pathlib import Path
import matplotlib.pyplot as plt

# Input and output paths
input_file = Path("results/rice_mut1_fastp.json")
output_dir = Path("figures")
output_dir.mkdir(exist_ok=True)

# Read fastp report
with open(input_file) as file:
    data = json.load(file)

summary = data["summary"]
before = summary["before_filtering"]
after = summary["after_filtering"]

# Extract quality metrics
q20 = after["q20_rate"] * 100
q30 = after["q30_rate"] * 100
gc = after["gc_content"] * 100

# Graph 1: Sequencing quality metrics
metrics = ["Q20", "Q30", "GC content"]
values = [q20, q30, gc]

plt.figure(figsize=(8, 5))
bars = plt.bar(metrics, values)

plt.title("Rice Mutant NGS - Sequencing Quality Metrics")
plt.ylabel("Percentage (%)")
plt.ylim(0, 110)

for bar, value in zip(bars, values):
    plt.text(
        bar.get_x() + bar.get_width() / 2,
        bar.get_height() + 2,
        f"{value:.2f}%",
        ha="center"
    )

plt.tight_layout()
plt.savefig(output_dir / "fastp_quality_metrics.png", dpi=300)
plt.close()

# Graph 2: Before and after filtering
labels = ["Before filtering", "After filtering"]
reads = [
    before["total_reads"],
    after["total_reads"]
]

plt.figure(figsize=(8, 5))
bars = plt.bar(labels, reads)

plt.title("Read Count Before and After fastp Filtering")
plt.ylabel("Number of reads")

for bar, value in zip(bars, reads):
    plt.text(
        bar.get_x() + bar.get_width() / 2,
        bar.get_height(),
        f"{value:,}",
        ha="center",
        va="bottom"
    )

plt.tight_layout()
plt.savefig(output_dir / "fastp_read_comparison.png", dpi=300)
plt.close()

print("NGS quality analysis completed successfully!")
print(f"Q20: {q20:.2f}%")
print(f"Q30: {q30:.2f}%")
print(f"GC content: {gc:.2f}%")
print("Graphs saved in the figures folder.")
