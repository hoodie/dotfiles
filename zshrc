## oh-my-zsh stuff
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
plugins=( colorize
          git git-extras gitfast compleat archlinux
          systemd rust
          z zsh-syntax-highlighting
          svn svn-fast-info
          xcode
          emoji-clock
          )
# theme
source $ZSH/oh-my-zsh.sh
source ~/.dotfiles/hendriks_prompt.zsh-theme
export DEFAULT_USER=hendriks

# Editor
export EDITOR=vim
export FCEDIT=vim
export VISUAL=vim # for crontab

# aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
source ~/.bash_aliases
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

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

if [ -n "${commands[direnv]}" ]; then; eval "$(direnv hook zsh)"; fi
if [ -n "${commands[starship]}" ]; then; export STARSHIP_CONFIG="$HOME/.dotfiles/starship.toml";eval "$(starship init zsh)"; fi

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#PATHS
export CARGO_PATH=$HOME/.cargo/bin

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export DENO_INSTALL="/Users/hendrik/.deno"

PATH=$PATH:$CARGO_PATH
export PATH="$DENO_INSTALL/bin:$PATH"

# Wasmer
export WASMER_DIR="/Users/hendriks/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"

