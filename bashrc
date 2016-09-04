# ~/.bashrc: executed by bash(1) for non-login shells.


# Check for an interactive session
[ -z "$PS1" ] && return

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

## SETTINGS PROMPT
# RED ROOT
if [ `whoami` == "root" ]
then
  name_color=${RED}
else
  name_color=${lightgreen}
fi

# PS1 comes in to flavors
function longps(){ PS1="${name_color}\u${white}:${BLUE}\w${NC}\$ " ; }
function shortps(){ PS1="${name_color}\u${white}:${BLUE}\W${NC}\$ " ; }
shortps

PS2="${NC}--> ${white}"

[ -z "$PS1" ] && return
[ -n "$TMUX" ] && export TERM=screen-256color

# Editor
export EDITOR=vim
export FCEDIT=vim
export VISUAL=vim                           # for crontab

# History file
# (must haves for those that use the command line alot)
# Increase history file size,
# increase number of commands saved (default: 500),
# append commands instead of overwriting (nice for two or more sessions),
# add command to history after executing,
# don't put duplicate lines in history, ignore same successive entries. # thanks to kyle keen
export HISTFILESIZE=20000
export HISTSIZE=5000
shopt -s histappend
PROMPT_COMMAND='history -a'
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth


# Autocorect 'cd' mis-spellings
shopt -s cdspell
# Extended pattern matching features
shopt -s extglob
# Hostname expansion
#shopt -s hostcomplete

# Bash completion extended
set show-all-if-ambiguous on

# Allow 'less' to view non-text files (allows viewing of compressed files)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

PATH=$PATH:$HOME/.cabal/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

GPG_TTY=`tty`
export GPG_TTY

export RUST_SRC_PATH=/usr/src/rust/src
export RUST_BACKTRACE=0
source /usr/share/chruby/chruby.sh
