input_file="/Users/sangeetasingh/Code/sangeetaS/UsingBash/input.txt"

# Function to calculate the total Calories carried by an Elf
calculate_total_calories() {
  local total=0
  for calorie in "${elf_calories[@]}"; do
    total=$((total + calorie))
  done
  echo "$total"
}

max_calories=0
max_calories_elf=0
current_elf=0

while IFS= read -r line; do
  if [ -z "$line" ]; then
    # Blank line indicates the end of an Elf's inventory
    total_calories=$(calculate_total_calories)
    if [ "$total_calories" -gt "$max_calories" ]; then
      max_calories="$total_calories"
      max_calories_elf="$current_elf"
    fi

    # Reset for the next Elf
    elf_calories=()
    current_elf=$((current_elf + 1))
  else
    # Add the Calories to the current Elf's inventory
    elf_calories+=("$line")
  fi
done < "$input_file"

# Check for the last Elf's inventory if not followed by a blank line
if [ ${#elf_calories[@]} -gt 0 ]; then
  total_calories=$(calculate_total_calories)
  if [ "$total_calories" -gt "$max_calories" ]; then
    max_calories="$total_calories"
    max_calories_elf="$current_elf"
  fi
fi

echo "The Elf carrying the most Calories is Elf $max_calories_elf"
echo "The total Calories carried by that Elf is $max_calories"
