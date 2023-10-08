#!/bin/bash

# Define the network range to scan (adjust as needed)
network_range="192.168.1.0/24"

# Define the cache directory
cache_dir="$HOME/.cache/ssh"

# Create the cache directory if it doesn't exist
mkdir -p "$cache_dir"

# Define the cache file path with a timestamp
timestamp=$(date +%Y%m%d%H%M%S)
cache_file="$cache_dir/scan-ssh-$timestamp.txt"

# Use nmap to scan for SSH (port 22) on all devices in the network range
nmap -p 22 --open "$network_range" -oG - | awk '/22\/open/ {print $2}' > "$cache_file"

echo "SSH scan results saved to $cache_file"

