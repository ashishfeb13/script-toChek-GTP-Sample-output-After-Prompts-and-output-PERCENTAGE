#!/bin/bash

# Path to your input file
INPUT_FILE="your_input_file.txt"

# Output file to save the percentages
OUTPUT_FILE="output.txt"

# Count the occurrences of each keyword
count_algae=$(grep -i "algae" "$INPUT_FILE" | wc -l)
count_virus=$(grep -i "virus" "$INPUT_FILE" | wc -l)
count_bacteria=$(grep -i "bacteria" "$INPUT_FILE" | wc -l)
count_fungi=$(grep -i "fungi" "$INPUT_FILE" | wc -l)

# Get the total count
total_count=$(wc -w < "$INPUT_FILE")

# Calculate the percentages
percentage_algae=$(awk "BEGIN {printf \"%.2f\", (${count_algae} / ${total_count}) * 100}")
percentage_virus=$(awk "BEGIN {printf \"%.2f\", (${count_virus} / ${total_count}) * 100}")
percentage_bacteria=$(awk "BEGIN {printf \"%.2f\", (${count_bacteria} / ${total_count}) * 100}")
percentage_fungi=$(awk "BEGIN {printf \"%.2f\", (${count_fungi} / ${total_count}) * 100}")

# Save the percentages to the output file
echo "Algae: $percentage_algae%" > "$OUTPUT_FILE"
echo "Virus: $percentage_virus%" >> "$OUTPUT_FILE"
echo "Bacteria: $percentage_bacteria%" >> "$OUTPUT_FILE"
echo "Fungi: $percentage_fungi%" >> "$OUTPUT_FILE"

# Display the percentages as a graph (requires matplotlib)
python3 - <<EOF
import matplotlib.pyplot as plt

# Data for the graph
labels = ['Algae', 'Virus', 'Bacteria', 'Fungi']
sizes = [$percentage_algae, $percentage_virus, $percentage_bacteria, $percentage_fungi]

# Create a pie chart
plt.figure(figsize=(8, 8))
plt.pie(sizes, labels=labels, autopct='%1.1f%%', startangle=140)
plt.axis('equal')
plt.title('Percentage of Keywords')

# Save the graph as a PNG file
plt.savefig('output_graph.png')

# Display the graph
plt.show()
EOF



##script-toChek-Sample-output-AfterPromptsinPERCENTAGE-ashish.sh

##Readme
# Keyword Percentage Calculator
#
#This script calculates the percentage of occurrences of keywords ('Algae', 'Virus', 'Bacteria', 'Fungi') in a text file.
#
## Usage
#
#```bash
#./script.sh input_file.txt
