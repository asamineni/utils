#!/bin/bash  
  
# Check if the correct number of arguments is provided  
if [ "$#" -ne 2 ]; then  
    echo "Usage: $0 <input_file> <output_file>"  
    exit 1  
fi  
  
input_file="$1"  
output_file="$2"  
  
# Regular expression for matching GUIDs at the end of the line  
guid_regex='[0-9a-fA-F]\{8\}-[0-9a-fA-F]\{4\}-[0-9a-fA-F]\{4\}-[0-9a-fA-F]\{4\}-[0-9a-fA-F]\{12\}$'  
  
# Extract lines containing GUIDs at the end and write to output file  
grep -E "$guid_regex" "$input_file" > "$output_file"  
  
# Inform the user about the output  
echo "Extracted lines with GUIDs have been written to $output_file."  
