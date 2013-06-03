# ~/.bashrc: executed by bash(1) for non-login shells.


# Check for an interactive session
[ -z "$PS1" ] && return

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# settings prompt
if [ `whoami` == "root" ]
then
  name_color=${RED}
else
  name_color=${lightgreen}
fi
function longps(){ PS1="${name_color}\u${white}:${blue}\w${NC}\$ " ; }
function shortps(){ PS1="${name_color}\u${white}:${blue}\W${NC}\$ " ; }
longps

[ $USER == 'root' ]	&& PS1="${red}\u${white}:${blue}\w${white}\$ "
PS2="${NC}--> ${white}"

[ -z "$PS1" ] && return
[ -n "$TMUX" ] && export TERM=screen-256color

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f /etc/bash_completion.d ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

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

# Less Colors for Man Pages
if [[ ${TERM} == "xterm" ]]; then
  export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # bold mode      - main      (cyan)
  export LESS_TERMCAP_us=$'\e[38;5;97m'     # underline mode - second    (purp)
  export LESS_TERMCAP_so=$'\e[01;32m' # standout-mode  - info/find (gray)
  export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking - unused?   (red)
  export LESS_TERMCAP_ue=$'\e[0m'           # end underline
  export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
  export LESS_TERMCAP_me=$'\e[0m'           # end all mode        - txt rest
else
  export LESS_TERMCAP_md=$'\e[01;34m'
  export LESS_TERMCAP_us=$'\e[01;35m'
  export LESS_TERMCAP_so=$'\e[01;30m'
  export LESS_TERMCAP_mb=$'\e[01;31m'
  export LESS_TERMCAP_ue=$'\e[0m'
  export LESS_TERMCAP_se=$'\e[0m'
  export LESS_TERMCAP_me=$'\e[0m'
fi

PATH=$PATH:$HOME/.rvm/bin:$HOME/bin # Add RVM to PATH for scripting
