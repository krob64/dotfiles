alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout'
alias gl='git log'

alias vim='nvim'
alias py='python3'

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='la -A'
alias l='ls -CF'

export PATH="/home/krob/scripts:$PATH"
export NVIM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # this loads nvm
. "$HOME/.cargo/env"


setopt HIST_SAVE_NO_DUPS

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{blue}%1d%f %F{green}${vcs_info_msg_0_}%f$ '


autoload -U compinit; compinit
source $HOME/.config/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
bindkey -s ^f "tmux-sessionizer\n"
