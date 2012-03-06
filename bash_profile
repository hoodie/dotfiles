#!/bin/bash
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
  longps(){
    PS1="${lightgreen}\u${white}@${blue}\h${white}:${blue}\w${NC}\$ "
  }
  shortps(){
    PS1="${lightgreen}\u${white}@${blue}\h${white}:${blue}\W${NC}\$ "
  }
  longps

fi
