# zshrc - zsh config
# by zee (github.com/eazee)
export ZSH="$HOME/.oh-my-zsh"

# theme & plugins
ZSH_THEME="ext-arrow"
plugins=(git nginx npm zsh-syntax-highlighting zsh-autosuggestions globalias)

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# custom aliases
# general
alias c='clear'
alias x='exit'
alias -g G='| grep --color=auto -P'
alias ls='ls --color=tty -AF'
alias -g L='| less'
alias ffs='sudo !!'
# system information
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias distro='cat /etc/*-release'
# file/directory shortcuts
alias wsp='cd ~/workspace'
# file editing/management
alias v='vim'
alias vv='sudo vim'
alias untar='tar -xzf'
alias mine='sudo chown -R $USER:$USER'
# service management
alias sc='sudo systemctl'
alias scup='sudo systemctl start'
alias scdown='sudo systemctl stop'
alias scenable='sudo systemctl enable'
alias scre='sudo systemctl restart'
alias scst='sudo systemctl status'
# package management
alias grab='sudo apt install'
alias grab!='sudo apt install -y'
alias sup='sudo apt update'
alias sapt='sudo apt'
# shell config management
alias zshrc='vim ~/.zshrc'
alias profile='vim ~/.profile.zsh'
alias reload='source ~/.zshrc'

# load custom shell profile if exists
if [ -f "$HOME/.profile.zsh" ]; then
    source $HOME/.profile.zsh
else
    echo "# custom shell stuff goes here" >> $HOME/.profile.zsh
fi