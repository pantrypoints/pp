#!/bin/bash

# Directory to target
TARGET_DIR="./content/en/research/countries/us/mandate"

# Define your front matter (YAML format)
read -r -d '' FRONT_MATTER << EOM
---
title: "Default Title"
date: "$(date +%Y-%m-%d)"
description: ""
c: "maroon"
icon: "US"
---
EOM

# Loop through all Markdown files in the directory
find "$TARGET_DIR" -type f -name "*.md" | while read -r file; do
    # Check if file already contains front matter
    if ! grep -q "^---" "$file"; then
        echo "Adding front matter to $file"
        # Add front matter to a temp file, then append the original content
        tmpfile=$(mktemp)
        echo "$FRONT_MATTER" > "$tmpfile"
        cat "$file" >> "$tmpfile"
        mv "$tmpfile" "$file"
    else
        echo "Front matter already exists in $file, skipping."
    fi
done
