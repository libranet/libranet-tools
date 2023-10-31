#!/bin/bash


cd /opt/tools/black && make update
echo -e "\n\n"

cd /opt/tools/isort && make update
echo -e "\n\n"

cd /opt/tools/pre-commit && make update
echo -e "\n\n"

cd /opt/tools/pyenv && make update
echo -e "\n\n"

cd /opt/tools/ruff && make update
echo -e "\n\n"

cd /opt/tools/twine && make update
echo -e "\n\n"

cd /opt/tools/xdg-ninja && make update
echo -e "\n\n"
 
cd /opt/tools/zestreleaser && make update
echo -e "\n\n"
 

# Define a function to update a tool
update_tool() {
  tool_dir="$1"
  (cd "$tool_dir" && make update)
}

# List of tool directories to update
tool_directories=(
  "/opt/tools/black"
  "/opt/tools/ruff"
  "/opt/tools/isort"
)

# Use parallel to execute the update_tool function for each tool directory
# export -f update_tool

# Use parallel to execute the update_tool function for each tool directory
# parallel -j4 update_tool ::: "${tool_directories[@]}"
