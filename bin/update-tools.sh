#!/bin/bash


echo -e "Git pull in /opt/dotfiles"
cd /opt/dotfiles/
git pull

echo -e "Git pull in /opt/tools"
cd /opt/tools/
git pull

echo -e "Updating black"
cd /opt/tools/black && make update
echo -e "\n\n"

echo -e "Updating isort"
cd /opt/tools/isort && make update
echo -e "\n\n"

echo -e "Updating poetry"
cd /opt/tools/poetry && make update
echo -e "\n\n"

echo -e "Updating pre-commit"
cd /opt/tools/pre-commit && make update
echo -e "\n\n"

echo -e "Updating pyenv"
cd /opt/tools/pyenv && make update
echo -e "\n\n"

echo -e "Updating ruff"
cd /opt/tools/ruff && make update
echo -e "\n\n"

echo -e "Updating twine"
cd /opt/tools/twine && make update
echo -e "\n\n"

echo -e "Updating uv"
cd /opt/tools/uv && make update
echo -e "\n\n"

echo -e "Updating xdg-ninja"
cd /opt/tools/xdg-ninja && make update
echo -e "\n\n"
 
echo -e "Updating zestreleaser"
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
