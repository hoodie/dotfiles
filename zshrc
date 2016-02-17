
## oh-my-zsh stuff
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
plugins=( git git-extras gitfast compleat archlinux kate cabal systemd coffee rails cargo rust) 
#ZSH_THEME=agnoster
# theme
source $ZSH/oh-my-zsh.sh
source ~/.dotfiles/hendriks_prompt.zsh
export DEFAULT_USER=hendrik



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



# bashstyle comments
setopt interactivecomments


# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

#PATHS
CARGO_PATH=$HOME/.multirust/toolchains/stable/cargo/bin
CABAL_PATH=$HOME/.cabal/bin
RVM_PATH=$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#PATH=$PATH:$CARGO_PATH:$CABAL_PATH:$RVM_PATH
PATH=$PATH:$CARGO_PATH:$CABAL_PATH


export RUST_SRC_PATH=$HOME/code/hub/rust/src
export RUST_BACKTRACE=0
#export L4RE_BUILD_PATH=$HOME/TUD/Diplomarbeit/OS/l4re/build
#export FIASCO_BUILD_PATH=$HOME/TUD/Diplomarbeit/OS/TUDOS/src/kernel/fiasco/mybuild

#envoy id_rsa
#source <(envoy -p)

