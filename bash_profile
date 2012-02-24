#!/bin/bash
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
  longps(){
    PS1="${lightgreen}\u${white}@${blue}\h${white}:${BLUE}\w${NC}\$ "
  }
  shortps(){
    PS1="${lightgreen}\u${white}@${blue}\h${white}:${BLUE}\W${NC}\$ "
  }
  longps

fi
