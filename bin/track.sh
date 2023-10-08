#!/bin/bash

# Get the directory path from the first command-line argument (or default to current directory)
target_dir="${1:-.}"

# Ensure the directory exists
if [ ! -d "$target_dir" ]; then
    echo "Directory $target_dir does not exist."
    exit 1
fi

# Specify the new .gitignore file path
new_gitignore="$target_dir/.gitignore.new"

# Use find to list all symbolic links and write them to the new .gitignore file
find "$target_dir" -type l | sed 's|^\./||' | sort > "$new_gitignore"

# Determine the marker line in the existing .gitignore file
marker_line="# exclude all symlinks - GENERATED by track.sh"

# Use 'awk' to extract the content above the marker line
awk -v marker="$marker_line" 'NR == FNR && !found && $0 ~ marker {found=1} NR != FNR && found {print; next} NR != FNR && !found' "$target_dir/.gitignore" "$new_gitignore" > "$new_gitignore.temp"
awk -v marker="$marker_line" 'NR == FNR && !found && $0 ~ marker {found=1} NR != FNR && found {print; next} NR != FNR && !found' "$target_dir/.gitignore" "$new_gitignore" > "$new_gitignore.header"

# Add a separator line below the marker line
echo -e "\n# exclude all symlinks - GENERATED by track.sh\n\n" >> "$new_gitignore.temp"

# Add two blank lines
# echo -e "\n\n" >> "$new_gitignore.temp"


# Add the generated content below the separator line without "./" prefix
sed 's|^\./||' "$new_gitignore" >> "$new_gitignore.temp"

# Replace the existing .gitignore with the new one
cp "$new_gitignore.temp" "$target_dir/.gitignore"

echo "Done. Updated .gitignore file in $target_dir."
