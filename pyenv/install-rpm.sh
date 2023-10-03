
#!/bin/bash

# Check if the input file exists
if [ ! -f package_list.txt ]; then
    echo "Package list file 'package_list.txt' not found."
    exit 1
fi

# Loop through each package name in the file and install it
while read -r package_name; do
    if [ -n "$package_name" ]; then
        echo "Installing $package_name..."
        
        # Use the appropriate package manager (dnf, yum, or rpm) based on your distribution
        if command -v dnf &>/dev/null; then
            sudo dnf install -y "$package_name"
        elif command -v yum &>/dev/null; then
            sudo yum install -y "$package_name"
        elif command -v rpm &>/dev/null; then
            sudo rpm -i "$package_name.rpm"
        else
            echo "No package manager (dnf, yum, or rpm) found on this system."
            exit 1
        fi

        if [ $? -eq 0 ]; then
            echo "$package_name installed successfully."
        else
            echo "Error installing $package_name."
        fi
    fi
done < package_list.txt

