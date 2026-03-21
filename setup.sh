#!/usr/bin/env bash

# Safe setup script for virusPrank (demo/prank repository)
# This script provides guidance for installing optional dependencies.
# It intentionally avoids performing unsafe remote actions or hardcoding credentials.

set -euo pipefail

echo "================================"
echo "virusPrank Setup Script (safe/demo)"
echo "================================"
echo ""

cat <<'WARN'
WARNING: This repository contains prank/demo scripts. Only run these scripts on machines
you own or where you have explicit permission to test. Do NOT use this code for any
malicious purpose. The authors are not responsible for misuse.
WARN

echo ""

# Detect package manager and show instructions (do not force dangerous operations)
if command -v apt-get >/dev/null 2>&1; then
    echo "Detected apt-get (Debian/Ubuntu)."
    echo "Updating package lists..."
    sudo apt-get update
    echo "Installing optional dependency: sshpass"
    sudo apt-get install -y sshpass || echo "Failed to install sshpass via apt; install manually if needed."
elif command -v brew >/dev/null 2>&1; then
    echo "Detected Homebrew (macOS)."
    echo "sshpass is not recommended; prefer SSH keys. If you still need it, install via Homebrew:" 
    echo "  brew tap hudochenkov/sshpass && brew install sshpass || brew install sshpass"
else
    echo "Unknown package manager. Please install dependencies (e.g. sshpass) manually if required."
fi

echo ""
echo "================================"
echo "Setup Complete (instructions only)."
echo "================================"
echo ""
echo "This script does not automatically execute or deploy prank scripts. Review files before running them."
echo "Local testing (review first):"
echo "  chmod +x $(pwd)/virus.sh"
echo "  bash $(pwd)/virus.sh"
echo ""
echo "Safer remote workflow (recommended): use SSH key authentication and copy the script with scp:" 
echo "  scp -i /path/to/key $(pwd)/virus.sh user@REMOTE_IP:~/"
echo "  ssh -i /path/to/key user@REMOTE_IP 'bash ~/virus.sh'"
echo ""
echo "If you must use password-based SSH, NEVER hardcode credentials in scripts. Replace placeholders when running:" 
echo "  sshpass -p 'PASSWORD' ssh user@REMOTE_IP 'bash -s' < $(pwd)/virus.sh"
echo ""
echo "Replace user/REMOTE_IP/PASSWORD with safe values and ensure you have explicit permission."
echo ""
