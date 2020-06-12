# zshrc - zsh config
# by zee (github.com/eazee)
export ZSH="$HOME/.oh-my-zsh"

# theme & plugins
ZSH_THEME="ext-arrow"
plugins=(git nginx npm zsh-syntax-highlighting zsh-autosuggestions globalias)

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# custom aliases
alias c="clear"
alias gimme="sudo apt install"
alias -g G="| grep --color=auto -P"
alias ls='ls --color=tty -AF'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias distro='cat /etc/*-release'
alias sup='sudo apt update'
alias ffs='sudo !!'
alias zshrc='vim ~/.zshrc'
alias -g L='| less'
alias v='vim'
alias sv='sudo vim'
alias sc='sudo systemctl'
alias scup='sudo systemctl start'
alias scdown='sudo systemctl stop'
alias scenable='sudo systemctl enable'
alias scre='sudo systemctl restart'
alias scst='sudo systemctl status'
alias untar='tar -xzf'
alias wsp='cd ~/workspace'
alias mine='sudo chown -R $USER:$USER'

# load custom shell profile
source $HOME/.profile.zsh
