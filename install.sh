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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
if [ $UBUNTU ]; then
	sudo apt-get -y install git
fi
if [ $OSX ]; then
	brew install git
fi

