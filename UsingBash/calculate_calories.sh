#!/bin/bash

# Initialize variables
total_calories=0
max_calories=0
current_elf_calories=0

# Read the input line by line
while read -r line; do
  # Check if the line is empty (indicating a new Elf)
  if [ -z "$line" ]; then
    # Compare and update the maximum Calories if needed
    if [ "$current_elf_calories" -gt "$max_calories" ]; then
      max_calories=$current_elf_calories
    fi
    # Reset the current Elf's Calories for the new Elf
    current_elf_calories=0
  else
    # Add the Calories from the current line to the current Elf's total
    current_elf_calories=$((current_elf_calories + line))
    # Add the Calories to the overall total
    total_calories=$((total_calories + line))
  fi
done

# Check one more time after reaching the end of the input
if [ "$current_elf_calories" -gt "$max_calories" ]; then
  max_calories=$current_elf_calories
fi

# Print the result
echo "Total Calories: $total_calories"
echo "Max Calories carried by an Elf: $max_calories"