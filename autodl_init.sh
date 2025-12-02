#!/bin/bash

set -euo pipefail

# ==============================================================================
# Configurations / 配置
# ==============================================================================

# Colors / 颜色
C_RESET='\033[0m'
C_RED='\033[0;31m'
C_GREEN='\033[0;32m'
C_YELLOW='\033[0;33m'
C_BLUE='\033[0;34m'
C_PURPLE='\033[0;35m'
C_CYAN='\033[0;36m'

# ==============================================================================
# Functions / 函数定义
# ==============================================================================

# Function: Print a message and wait for user to press Enter
# 功能: 打印消息并等待用户按下回车键
function press_enter_to_continue() {
	echo -e "${C_CYAN}按下回车键以继续...${C_RESET}"
	read -r
}

# Function: Update apt
# 功能: 更新 apt
function update_apt() {
	echo -e "${C_BLUE}正在更新 apt...${C_RESET}"
	apt update
	echo -e "${C_GREEN}apt 更新完成。${C_RESET}"
}

# Function: Install zsh
# 功能: 安装 zsh
function install_zsh() {
	echo -e "${C_BLUE}正在安装 zsh...${C_RESET}"
	apt install zsh -y
	echo -e "${C_GREEN}zsh 安装完成。${C_RESET}"
}

# Function: Install tools
# 功能: 安装工具包
function install_tools() {
	echo -e "${C_BLUE}正在安装 curl, wget, tree, tmux...${C_RESET}"
	apt install curl wget tree tmux -y
	echo -e "${C_GREEN}工具包安装完成。${C_RESET}"
}

# Function: Install Oh My Zsh
# 功能: 安装 Oh My Zsh
function install_omz() {
	echo -e "${C_BLUE}正在安装 Oh My Zsh...${C_RESET}"
	sh -c "$(curl -fsSL https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh)"
	echo -e "${C_GREEN}Oh My Zsh 安装完成。${C_RESET}"
}

# Function: Install Powerlevel10k
# 功能: 安装 Powerlevel10k
function install_p10k() {
	echo -e "${C_BLUE}正在安装 Powerlevel10k...${C_RESET}"
	git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	echo -e "${C_GREEN}Powerlevel10k 安装完成。${C_RESET}"
}

# Function: Install zsh-autosuggestions
# 功能: 安装 zsh-autosuggestions
function install_autosuggestions() {
	echo -e "${C_BLUE}正在安装 zsh-autosuggestions...${C_RESET}"
	git clone https://gitee.com/mirrors/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	echo -e "${C_GREEN}zsh-autosuggestions 安装完成。${C_RESET}"
	echo -e "${C_YELLOW}注意: 安装后，请在 ~/.zshrc 文件的 plugins 数组中添加 'zsh-autosuggestions' 以启用插件。${C_RESET}"
}

# Function: Install uv
# 功能: 安装 uv
function install_uv() {
	echo -e "${C_BLUE}正在安装 uv...${C_RESET}"
	curl -LsSf https://astral.sh/uv/install.sh | sh
	echo -e "${C_GREEN}uv 安装完成。${C_RESET}"
}

# Function: Print the menu
# 功能: 打印菜单
function print_menu() {
	echo -e "${C_PURPLE}============ AutoDL 环境初始化脚本 ============${C_RESET}"
	echo " "
	echo -e "${C_CYAN}1. 更新 apt${C_RESET}"
	echo -e "${C_CYAN}2. 安装 zsh${C_RESET}"
	echo -e "${C_CYAN}3. 安装工具包 (curl, wget, tree, tmux)${C_RESET}"
	echo -e "${C_CYAN}4. 安装 Oh My Zsh${C_RESET}"
	echo -e "${C_CYAN}5. 安装 Powerlevel10k${C_RESET}"
	echo -e "${C_CYAN}6. 安装 zsh-autosuggestions${C_RESET}"
	echo -e "${C_CYAN}7. 安装 uv${C_RESET}"
	echo " "
	echo -e "${C_PURPLE}-----------------------------------------------${C_RESET}"
	echo -e "  ${C_RED}0. 退出${C_RESET}"
	echo " "
	read -p "$(echo -e ${C_YELLOW}请输入选项: ${C_RESET})" -r choice
}

# ==============================================================================
# Main Loop / 主循环
# ==============================================================================

while true; do
	clear
	print_menu

	case $choice in
	1) update_apt ;;
	2) install_zsh ;;
	3) install_tools ;;
	4) install_omz ;;
	5) install_p10k ;;
	6) install_autosuggestions ;;
	7) install_uv ;;
	0)
		echo -e "${C_GREEN}退出脚本。${C_RESET}"
		exit 0
		;;
	*) echo -e "${C_RED}无效的选项，请重新输入。${C_RESET}" ;;
	esac

	press_enter_to_continue
done
