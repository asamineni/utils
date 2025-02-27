#!/bin/bash

# Get input file name from command line argument
input_file="$1"
output_file="extracted_names.txt"

# Check if input file is provided
if [ -z "$input_file" ]; then
  echo "Error: Input file name is missing."
  echo "Usage: ./extract_names.sh <input_file>"
  exit 1
fi

# Check if input file exists
if [ ! -f "$input_file" ]; then
  echo "Error: Input file '$input_file' not found."
  exit 1
fi

# Extract lines matching the pattern "name_guid" and write to output file
grep -E '^[^_]+_[0-9a-fA-F]{32}$' "$input_file" > "$output_file"

echo "Extracted names with GUID from '$input_file' to '$output_file'"
