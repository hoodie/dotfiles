#!/bin/bash
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
  longps(){
    PS1="${lightgreen}\u${white}@${blue}\h${white}:${BLUE}\w${white}\$ "
  }
  shortps(){
    PS1="${lightgreen}\u${white}@${blue}\h${white}:${BLUE}\W${white}\$ "
  }
  longps

fi
