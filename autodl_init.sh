#!/bin/bash

set -euo pipefail

# AutoDL Environment Initialization Script
# This script provides a menu to initialize AutoDL environment with various options.
# Assumes the machine cannot access networks outside China.

echo "AutoDL Environment Initialization Script"
echo "Select an option by entering the corresponding number:"
echo "1. Update apt"
echo "2. Install zsh"
echo "3. Install curl, wget, tree, tmux"
echo "4. Install Oh My Zsh (using Gitee mirror)"
echo "5. Install Powerlevel10k (using Gitee)"
echo "6. Install zsh-autosuggestions (using Gitee mirror)"
echo "7. Install uv"
echo "0. Exit"

while true; do
	read -p "Enter number (0 to exit): " choice
	case $choice in
	1)
		echo "Updating apt..."
		apt update
		echo "Apt update completed."
		;;
	2)
		echo "Installing zsh..."
		apt install zsh -y
		echo "Zsh installation completed."
		;;
	3)
		echo "Installing curl, wget, tree, tmux..."
		apt install curl wget tree tmux -y
		echo "Installation completed."
		;;
	4)
		echo "Installing Oh My Zsh..."
		sh -c "$(curl -fsSL https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh)"
		echo "Oh My Zsh installation completed."
		;;
	5)
		echo "Installing Powerlevel10k..."
		git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
		echo "Powerlevel10k installation completed."
		;;
	6)
		echo "Installing zsh-autosuggestions..."
		git clone https://gitee.com/mirrors/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
		echo "Zsh-autosuggestions installation completed."
		echo "Note: To enable zsh-autosuggestions, add 'zsh-autosuggestions' to the plugins array in your ~/.zshrc file."
		;;
	7)
		echo "Installing uv..."
		curl -LsSf https://astral.sh/uv/install.sh | sh
		echo "Uv installation completed."
		;;
	0)
		echo "Exiting script."
		break
		;;
	*)
		echo "Invalid option. Please enter a number between 0 and 7."
		;;
	esac
done
