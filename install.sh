#!/bin/bash

if hash apt-get 2>dev/null; then
	echo "Bootstrapping ubuntu"
	UBUNTU=true
	sudo apt-get -y update && sudo apt-get upgrade
	sudo apt-get -y
else
	echo "Bootstrapping OSX"
	ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
	brew doctor
	OSX=true
fi

if [ $UBUNTU ]; then
	sudo apt-get -y install git
fi
if [ $OSX ]; then
	brew install git
fi

# install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc

source ~/.zshrc
