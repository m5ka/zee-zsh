#!/bin/bash
# this is the setup script for my configuration of zsh & ohmyzsh
# you can run it by downloading and running this script
# or for a quicker alternative, just run it with the following command:
# sh -c "$(curl -fsSL https://gist.githubusercontent.com/eazee/fafa83be0a3af432eb1677146723a095/raw/cb3ab28cbfaa3c3953b9a3c7178a80ddde50d4bf/setup-zsh.sh)"

# make sure zsh is installed
if [ ! -f /usr/bin/zsh ]; then
	echo "You don't seem to have zsh installed! Try this:"
	echo "$ sudo apt install zsh"
	echo "(or whatever works for your system) before running the script again."
	exit 1
else
	echo "zsh is installed :)"
fi

# if .oh-my-zsh is not installed
if [ ! -e $HOME/.oh-my-zsh ]; then
	echo "installing ohmyzsh..."
	CHSH=no
	RUNZSH=no
	KEEP_ZSHRC=yes
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
	echo "ohmyzsh already installed :)"
fi

OMZ_TARGET=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

# syntax highlighting plugin
if [ ! -e $OMZ_TARGET/plugins/zsh-syntax-highlighting ]; then
	echo "installing zsh-syntax-highlighting..."
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $OMZ_TARGET/plugins/zsh-syntax-highlighting
else
	echo "zsh-syntax-highlighting already installed :)"
fi

# autosuggestions
if [ ! -e $OMZ_TARGET/plugins/zsh-autosuggestions ]; then
	echo "installing zsh-autosuggestions..."
	git clone https://github.com/zsh-users/zsh-autosuggestions $OMZ_TARGET/plugins/zsh-autosuggestions
else
	echo "zsh-autosuggestions already installed :)"
fi

# nginx
if [ ! -e $OMZ_TARGET/plugins/nginx ]; then
	echo "installing nginx plugin..."
	git clone https://github.com/miklos-martin/oh-my-zsh-plugins $HOME/.installed/miklos-martin-plugins
	ln -s $HOME/.installed/miklos-martin-plugins/nginx $OMZ_TARGET/plugins/nginx
else
	echo "nginx plugin already installed :)"
fi

if [ ! -f $OMZ_TARGET/themes/extcloud.zsh-theme ]; then
	echo "downloading extcloud theme..."
	curl -fsSL https://gist.githubusercontent.com/eazee/d371e4017c8f20a44f783402c902c981/raw/53b7d9d22e2c6ecdc5fc5e94dc1af41d173044d7/extcloud.zsh-theme > $OMZ_TARGET/themes/extcloud.zsh-theme
else
	echo "extcloud theme already installed :)"
fi

read -p "Do you want to change your shell to zsh? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	if [ ! $SHELL = "/usr/bin/zsh" ]; then
		echo "changing shell to zsh..."
		chsh -s /usr/bin/zsh $USER
	else
		echo "shell is already set to zsh"
	fi
fi

# choice whether to get zshrc or not
read -p "Do you want to clone the .zshrc from github.com/eazee? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo "cloning zshrc into $HOME/.zshrc"
	curl -fsSL https://gist.githubusercontent.com/eazee/2872fa9bbf7d855aa70f72730218c6b9/raw/5164a0ec2a0db6b35a1bdd883b218a6bb471afea/.zshrc > $HOME/.zshrc
fi

echo "all done! you'll need to restart your terminal to see the difference."
echo "thanks for using my lil setup script (:"
