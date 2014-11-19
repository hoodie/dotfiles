
## oh-my-zsh stuff
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
plugins=( git git-extras gitfast compleat archlinux kate cabal systemd coffee)
source $ZSH/oh-my-zsh.sh



# Editor
export EDITOR=vim
export FCEDIT=vim
export VISUAL=vim                           # for crontab

# aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
source ~/.bash_aliases


# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
compinit
autoload -Uz compinit
COMPLETION_WAITING_DOTS="true"

# The following lines were added by compinstall
zstyle :compinstall filename '/home/hendrik/.zshrc'


# theme
source ~/.dotfiles/hendriks_prompt.zsh

# bashstyle comments
setopt interactivecomments


# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

#PATHS
PATH=$PATH:$HOME/.cabal/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export AVG_PATH=/home/hendrik/code/hub

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
eval $(ssh-agent) >> /dev/null
