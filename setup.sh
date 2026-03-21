#!/bin/bash

# Setup script for virusPrank
# This script installs dependencies and configures the environment

set -e  # Exit on error

echo "================================"
echo "virusPrank Setup Script"
echo "================================"
echo ""

# Check if running on Ubuntu/Debian
if ! command -v apt-get &> /dev/null; then
    echo "Error: This script requires Ubuntu/Debian-based system"
    exit 1
fi

# Update package lists
echo "Updating package lists..."
sudo apt-get update

# Install sshpass for SSH authentication
echo "Installing sshpass..."
sudo apt-get install -y sshpass

echo ""
echo "================================"
echo "Setup Complete!"
echo "================================"
echo ""
echo "To run the prank on a remote machine:"
echo ""
echo "  sshpass -p \"aluno@123\" ssh aluno@<REMOTE_IP> 'bash -s' < $(pwd)/virus.sh"
echo ""
echo "Replace <REMOTE_IP> with the target machine's IP address"
echo ""
