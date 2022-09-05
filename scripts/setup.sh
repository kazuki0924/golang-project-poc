#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Installs both CLI and GUI tools, etc.
# expected to be executed from the project root

read -rp "Is Homebrew installed? [y/N]"$'\n> ' UserInput && [[ ${UserInput} != "y" ]] && exit 1
echo "Installing packages with Homebrew..."
set +e
brew bundle --verbose --no-lock --file=Brewfile
set -e
read -rp "Is MacPorts installed? [y/N]"$'\n> ' UserInput && [[ ${UserInput} != "y" ]] && exit 1
echo "Installing packages with MacPorts..."
sudo port selfupdate
sudo port install pgmodeler
echo "Installing packages with pip..."
./scripts/setup_and_install_with_pip.sh
echo "Installing pre-commit..."
pre-commit install --config .pre-commit-config.yml
