#!/bin/bash
# this is the setup script for my configuration of zsh & ohmyzsh
# you can run it by downloading and running this script
# or for a quicker alternative, just run it with the following command:
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/eazee/zeesh/master/setup-zsh.sh)"

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
	curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh > $HOME/.zsh-install.tmp.sh
	sh $HOME/.zsh-install.tmp.sh --unattended
	rm $HOME/.zsh-install.tmp.sh
else
	echo "ohmyzsh already installed :)"
fi

OMZ_TARGET=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

# syntax highlighting plugin
if [ ! -e $OMZ_TARGET/plugins/zsh-syntax-highlighting ]; then
	echo "installing zsh-syntax-highlighting..."
	git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git $OMZ_TARGET/plugins/zsh-syntax-highlighting
else
	echo "zsh-syntax-highlighting already installed :)"
fi

# autosuggestions
if [ ! -e $OMZ_TARGET/plugins/zsh-autosuggestions ]; then
	echo "installing zsh-autosuggestions..."
	git clone -q https://github.com/zsh-users/zsh-autosuggestions $OMZ_TARGET/plugins/zsh-autosuggestions
else
	echo "zsh-autosuggestions already installed :)"
fi

# nginx
if [ ! -e $OMZ_TARGET/plugins/nginx ]; then
	echo "installing nginx plugin..."
	if [ ! -e $HOME/.installed/miklos-martin-plugins ]; then
		git clone -q https://github.com/miklos-martin/oh-my-zsh-plugins $HOME/.installed/miklos-martin-plugins 
	fi
	ln -s $HOME/.installed/miklos-martin-plugins/nginx $OMZ_TARGET/plugins/nginx
else
	echo "nginx plugin already installed :)"
fi

# custom theme (ext-arrow)
if [ ! -e $OMZ_TARGET/themes/ext-arrow.zsh-theme ]; then
	echo "downloading ext-arrow theme"
	curl -fsSL https://raw.githubusercontent.com/eazee/zeesh/master/ext-arrow.zsh-theme > $OMZ_TARGET/themes/ext-arrow.zsh-theme
else
	echo "ext-arrow theme already installed"
fi

echo -n "Do you want to change your shell to zsh? "
read reply
if [ $reply = "Y" ] || [ $reply = "y" ]; then
	if [ ! $SHELL = "/usr/bin/zsh" ]; then
		echo "changing shell to zsh..."
		chsh -s /usr/bin/zsh $USER
	else
		echo "shell is already set to zsh"
	fi
fi

# choice whether to get zshrc or not
echo -n "Do you want to clone the .zshrc from github.com/eazee? "
read reply
if [ $reply = "Y" ] || [ $reply = "y" ] ; then
	echo "cloning zshrc into $HOME/.zshrc"
	curl -fsSL https://raw.githubusercontent.com/eazee/zeesh/master/.zshrc > $HOME/.zshrc
fi

echo "all done! you'll need to restart your terminal to see the difference."
echo "thanks for using my lil setup script (:"
