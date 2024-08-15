# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/andrew/.oh-my-zsh"

plugins=(ssh-agent zsh-syntax-highlighting zsh-autosuggestions kubectl)

zstyle :omz:plugins:ssh-agent agent-forwarding yes

source $ZSH/oh-my-zsh.sh

alias gitcleanup="git fetch -p && git branch -vv | grep 'origin/.*: gone]' | awk '{print \$1}' | xargs git branch -D"
alias vim="nvim"
alias k="kubectl"
alias kns="kubens"
alias kctx="kubectx"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
