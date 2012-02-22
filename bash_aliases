#!/bin/bash

test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
alias l='ls'
alias lsd='ls -d */'
alias ls='ls --color=auto --group-directories-first'
alias lash='ls -lash'
alias ramdisk='[ -d ~/Desktop/ram ] || mkdir ~/Desktop/ram ] && sudo mount -t tmpfs none ~/Desktop/ram && df | grep none '
#alias ssh='autossh'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'
alias monoplayer="mplayer -af pan=1:0.5:0.5 -channels 1"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias gr='find . | grep -v .svn | xargs grep -Iisrn'
alias cgr='find . -iname \*.c | grep -v .svn | xargs grep -Iisrn'
alias hgr='find . -iname \*.h | grep -v .svn | xargs grep -Iisrn'
alias du="du -h"
alias df="df -h"
alias cd..="cd .." #work around a common typo
alias vi=vim
alias serve='python -m SimpleHTTPServer'
alias :e=vim
alias :q=exit
#alias rm='rm -i'
alias sudi='sudo -i'
alias vcat='mencoder -oac copy -ovc copy -o'
alias pwdend='pwd | awk -F"/" "{print \$NF}"'
alias 'svnpull'='git svn rebase'
alias 'svnpush'='git svn rebase ; git svn dcommit'

alias grepmail="grep -Eio '\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b'"

if [ -x /usr/bin/notify-send ]; then
	  alias alert='notify-send -i gnome-terminal "[$?] $(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/;\s*alert$//'\'')"'
fi

QTDIR=/usr/share/qt

red='\[\e[0;31m\]'
RED='\[\e[1;31m\]'
blue='\[\e[0;34m\]'
BLUE='\[\e[1;34m\]'
cyan='\[\e[0;36m\]'
CYAN='\[\e[1;36m\]'
NC='\033[0m'      # no color
black='\[\e[0;30m\]'
BLACK='\[\e[1;30m\]'
green='\[\e[0;32m\]'
GREEN='\[\e[1;32m\]'
lightgreen='\[\e[0;92m\]'
LIGHTGREEN='\[\e[1;92m\]'
yellow='\[\e[0;33m\]'
YELLOW='\[\e[1;33m\]'
magenta='\[\e[0;35m\]'
MAGENTA='\[\e[1;35m\]'
white='\[\e[0;37m\]'
WHITE='\[\e[1;37m\]'

## Moving around & all that jazz
alias back='cd $OLDPWD'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

