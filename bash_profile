#!/bin/bash
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
  longps(){
    PS1="${green}\u${white}@${blue}\h${white}:${blue}\w${NC}\$ "
  }
  shortps(){
    PS1="${green}\u${white}@${blue}\h${white}:${blue}\W${NC}\$ "
  }
  longps
fi
