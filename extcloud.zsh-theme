ZSH_THEME_CLOUD_COLOR=cyan
if [ -z $ZSH_THEME_CLOUD_PREFIX ]; then
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        ZSH_THEME_CLOUD_COLOR=white
        ZSH_THEME_CLOUD_PREFIX="$USER@$HOST"
    elif [ $UID -eq 0 ]; then
        ZSH_THEME_CLOUD_COLOR=yellow
        ZSH_THEME_CLOUD_PREFIX='#'
    else
        ZSH_THEME_CLOUD_PREFIX='☁'
    fi
fi

PROMPT='$fg_bold[$ZSH_THEME_CLOUD_COLOR]$ZSH_THEME_CLOUD_PREFIX %{$fg_bold[green]%}%p %{$fg[green]%}%c %{$fg_bold[cyan]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}] %{$fg[yellow]%}⚡ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}]"