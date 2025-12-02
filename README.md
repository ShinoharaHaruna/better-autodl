# AutoDL Environment Initialization Script

This is a Shell script for quickly initializing the AutoDL environment. The script assumes the machine cannot access networks outside mainland China, therefore it uses domestic mirror sources.

## Features

The script provides the following options, selected by entering a number:

1. **Update apt**: Executes `apt update`
2. **Install zsh**: Executes `apt install zsh -y`
3. **Install Toolkit**: Installs curl, wget, tree, tmux: `apt install curl wget tree tmux -y`
4. **Install Oh My Zsh**: Installs Oh My Zsh using a Gitee mirror
5. **Install Powerlevel10k**: Clones the Powerlevel10k theme using Gitee
6. **Install zsh-autosuggestions**: Clones the zsh-autosuggestions plugin using a Gitee mirror
7. **Install uv**: Installs uv using the official script

## Usage

1. Clone or download the script file `autodl_init.sh`
2. Run the script: `./autodl_init.sh`
3. Follow the prompts to enter a number to select a feature; enter 0 to exit.
4. The script supports loop selection, allowing multiple options to be executed.

## Notes

- The script runs as root by default in the AutoDL environment; no sudo is needed.
- After installing zsh-autosuggestions, you need to manually add `'zsh-autosuggestions'` to the `plugins` array in the `~/.zshrc` file to enable the plugin.
- After installing Powerlevel10k, you need to set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.zshrc` to use this theme.
- Ensure the machine can access Gitee and astral.sh.

## Requirements

- Bash
- curl and git installed (included in option 3)

## License

No license, free to use.
