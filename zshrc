
## oh-my-zsh stuff
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
plugins=( colorize
          git git-extras gitfast compleat archlinux
          kate cabal systemd coffee cargo rust
          z zsh-syntax-highlighting
          svn svn-fast-info
          xcode
          emoji-clock
          )
#plugins=( git git-extras gitfast compleat archlinux kate cabal systemd coffee cargo rust z)
#ZSH_THEME=agnoster
# theme
source $ZSH/oh-my-zsh.sh
source ~/.dotfiles/hendriks_prompt.zsh-theme
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

fpath+=~/.zfunc # local completions
# Uncomment following line if you want red dots to be displayed while waiting for completion
compinit
autoload -Uz compinit
COMPLETION_WAITING_DOTS="true"

# The following lines were added by compinstall
zstyle :compinstall filename '/home/hendrik/.zshrc'

# bashstyle comments
setopt interactivecomments

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

#PATHS
CARGO_PATH=$HOME/.cargo/bin
CABAL_PATH=$HOME/.cabal/bin
export GOPATH=$HOME/.go

if [ -n "${commands[direnv]}" ]; then; eval "$(direnv hook zsh)"; fi
if [ -n "${commands[chruby]}" ]; then; source /usr/share/chruby/chruby.sh; fi

PATH=$PATH:$CARGO_PATH:$GOPATH/bin

export RUST_SRC_PATH=$HOME/code/hub/rust/src
export RUST_BACKTRACE=1
export NVS_HOME="$HOME/.nvs"
[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"
export COL_BUILDS_ROOT='\\talos.drs.expertcity.com\dependencies'
#export COL_BUILDS_ROOT=/Users/hendrik/_localbuilds
export COL_ARTIFACTORY_ROOT=https://artifactory.prodwest.citrixsaassbe.net/artifactory/PlatformDependencies/com/getgo/dependencies/
export COL_LOCAL_BUILDS_ROOT=/Users/hendrik/_localbuilds

