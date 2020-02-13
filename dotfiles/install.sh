#!/usr/bin/env bash

# Update repos
apt update

# Install applications
apt install -y zsh curl git tmux

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" <<< y

# Enter zsh 

# Install spaceship theme
## Set path for custom themes
export ZSH_CUSTOM=~/.oh-my-zsh/custom
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Install bat
if apt-cache show bat > /dev/null 2>&1 ;
then
    apt install bat
else
    echo "Could not install bat, it is not available in the repository"
fi

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install