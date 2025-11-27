#!/bin/bash

# --- Configuration ---
# Directories to search for image references
SEARCH_DIRS=("content/" "content/en/research" "content/en/material" "themes/super/layouts" "themes/super/assets/css")
# Directory containing the actual static images (relative to project root)
# Assumes paths like /graphics/bio/tracks.jpg map to static/graphics/bio/tracks.jpg
STATIC_DIR="static"

# Temporary files for lists
REFERENCED_LIST_TMP=$(mktemp)
ACTUAL_LIST_TMP=$(mktemp)
UNUSED_LIST_OUTPUT="unused_images.txt"

# --- Safety Check ---
if [ ! -d "$STATIC_DIR" ]; then
  echo "Error: Static directory '$STATIC_DIR' not found."
  echo "Please check the STATIC_DIR variable in the script or run from the Hugo project root."
  exit 1
fi
missing_search_dir=0
for dir in "${SEARCH_DIRS[@]}"; do
  if [ ! -d "$dir" ]; then
    echo "Warning: Search directory '$dir' not found. Skipping."
    missing_search_dir=1
  fi
done
if [ ${#SEARCH_DIRS[@]} -eq 0 ] || [ $missing_search_dir -eq ${#SEARCH_DIRS[@]} ] ; then
    echo "Error: No valid search directories specified or found."
    exit 1
fi

echo "Step 1: Finding all actual image files..."

# Use find to locate all image files in the static directory
# -type f: only find files
# -iname: case-insensitive name matching for extensions
# \( ... -o ... \): OR conditions for extensions
# cd + find . : Change to static dir first to get relative paths easily
# sed 's|^\./|/|' : Replace leading './' with '/' to match reference format
# sort -u : Sorts and removes duplicates
(cd "$STATIC_DIR" && find . -type f \( \
    -iname "*.jpg" -o \
    -iname "*.jpeg" -o \
    -iname "*.png" -o \
    -iname "*.gif" -o \
    -iname "*.webp" \
  \) | sed 's|^\./|/|' ) | sort -u > "$ACTUAL_LIST_TMP"

echo "Found $(wc -l < "$ACTUAL_LIST_TMP") actual image files in '$STATIC_DIR'."
echo "List 2 (Actual Images) stored temporarily."


echo "Step 2: Finding all referenced image paths..."

# Use grep to find patterns, extract paths, clean them up, sort uniquely
# -r: recursive
# -o: only matching
# -h: suppress filename prefix
# -E: extended regex
# Regex breakdown:
#   "(/(?:[^"]+\.)(jpe?g|png|gif|webp))" : Matches src="/path/image.ext" - extracts /path/image.ext
#   "\((/(?:[^)]+\.)(jpe?g|png|gif|webp))\)": Matches [](/path/image.ext) - extracts /path/image.ext
#   sed 's/^[("]//; s/[)"]$//' : Removes leading/trailing quotes or parentheses
#   sort -u : Sorts and removes duplicates
# grep -rohE '"(/[^"]+\.(jpe?g|png|gif|webp))"|\((/[^)]+\.(jpe?g|png|gif|webp))\)' "${SEARCH_DIRS[@]}" | \
#  sed 's/^[("]//; s/[)"]$//' | \
#  sort -u > "$REFERENCED_LIST_TMP"

# Search recursively (-r) in /content, only in *.md files (--include),
# output only matches (-o), suppress filenames (-h), use extended regex (-E).
# Find absolute paths starting with / ending in image extensions, inside "" or ().
grep -rohE --include='*.md' '"(/[^"]+\.(jpe?g|png|gif|webp))"|\((/[^)]+\.(jpe?g|png|gif|webp))\)' "${SEARCH_DIRS[@]}" | sed 's/^[("]//; s/[)"]$//' | sort -u > "$REFERENCED_LIST_TMP"

echo "Found $(wc -l < "$REFERENCED_LIST_TMP") unique potential image references."
echo "List 1 (Referenced Images) stored temporarily."


echo "Step 3: Comparing lists to find unused images..."

# Use comm to compare the two sorted lists
# comm requires sorted input (which we ensured with sort -u)
# -1 : suppress lines unique to FILE1 (referenced images)
# -3 : suppress lines common to both files
# The result is lines unique to FILE2 (actual images) which are the unused ones.
comm -13 "$REFERENCED_LIST_TMP" "$ACTUAL_LIST_TMP" > "$UNUSED_LIST_OUTPUT"

echo "Comparison complete."
echo "List 3 (Unused Images) saved to: $UNUSED_LIST_OUTPUT"
echo "$(wc -l < "$UNUSED_LIST_OUTPUT") actual images seem to be unreferenced."

# --- Cleanup ---
rm "$REFERENCED_LIST_TMP" "$ACTUAL_LIST_TMP"
echo "Temporary files cleaned up."

# --- Optional: Display results ---
# echo "--- Unused Images ---"
# cat "$UNUSED_LIST_OUTPUT"
# echo "---------------------"