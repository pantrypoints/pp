#!/bin/bash

# Directory to target
TARGET_DIR="./content/en/research/countries/us/mandate/section-2/"

# Function to convert a string to title case using awk
to_title_case() {
  echo "$1" | awk '{
    for (i = 1; i <= NF; i++) {
      $i = toupper(substr($i,1,1)) tolower(substr($i,2))
    }
    print
  }'
}

# Process each Markdown file
find "$TARGET_DIR" -type f -name "*.md" | while read -r file; do
  # Check if the file has a title field
  if grep -q '^title: ' "$file"; then
    # Extract current title
    current_title=$(grep '^title: ' "$file" | sed 's/^title: *"*\(.*\)"*/\1/')

    # Convert to title case
    title_case=$(to_title_case "$current_title")

    # Replace the title line in the file
    sed -i '' -e "s/^title: .*/title: \"$title_case\"/" "$file"

    echo "Updated title in $file to: $title_case"
  else
    echo "No title field found in $file"
  fi
done
