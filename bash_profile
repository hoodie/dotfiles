#!/bin/bash
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
  if [ -n "$SSH_CLIENT" ]
  then
    longps(){ PS1="${green}\u${white}@${blue}\h${white}:${blue}\w${NC}\$ "; }
    shortps(){ PS1="${green}\u${white}@${blue}\h${white}:${blue}\W${NC}\$ "; }
  fi
  longps
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
source /home/hendrik/.bashrc
export PATH=/usr/lib/qt4/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/hendrik/bin:/home/hendrik/bin
