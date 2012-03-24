#!/bin/bash
# scriptname - description of script

scrpt=${0##*/}  # script name

#echo $scrpt
# Text color variables
txtred='\e[0;31m'       # red
txtgrn='\e[0;32m'       # green
txtylw='\e[0;33m'       # yellow
txtblu='\e[0;34m'       # blue
txtpur='\e[0;35m'       # purple
txtcyn='\e[0;36m'       # cyan
txtwht='\e[0;37m'       # white
bldred='\e[1;31m'       # red    - Bold
bldgrn='\e[1;32m'       # green
bldylw='\e[1;33m'       # yellow
bldblu='\e[1;34m'       # blue
bldpur='\e[1;35m'       # purple
bldcyn='\e[1;36m'       # cyan
bldwht='\e[1;37m'       # white
txtund=$(tput sgr 0 1)  # Underline
txtbld=$(tput bold)     # Bold
txtrst='\e[0m'          # Text reset

# Feedback indicators
function warn(){ echo -e ${bldred}! ${txtrst}${txtred}$*${txtrst} ; }
function info(){ echo -e ${bldblu}* ${txtrst}${txtblu}$*${txtrst} ; }
function pass(){ echo -e ${bldwht}* ${txtrst}${txtwht}$*${txtrst} ; }


##### everything above this can be reused


rcs="vim bash_aliases bash_profile bashrc gitconfig inputrc irbrc vimrc tmux.conf"
backup_dir="$HOME/dotfiles_backup/"

function test() {
  for rc in $rcs;
  do 
    if [ -f "$HOME/.$rc" ]
    then
      warn "$HOME/.$rc already exists"
    else
      info "$HOME/.$rc does not exist"
    fi
  done
}

function help(){
echo ''' setup dotfiles
usage: ./setup.sh [OPTION]

  -l 
      List all files concerned by this tool.

  -b  Backup all your current dotfiles by moving them into "path"

  -r  Restore your previously backed up dotfiles ( assuming you did the backup )

  -i  Install dotfiles (careful! make a backup first)

  -s  Soft install dotfiles same as -i but uses softlinks instead of copying

  -p  Update Pathogen

  -r  Restore old dotfiles from backup

  -h  This help message.
'''
}

function backup(){
  mkdir $backup_dir
  echo "copiing current dotfiles to $backup_dir"

  for rc in $rcs;
  do 
    if [ -f "$HOME/.$rc" ]
    then
      echo $rc
      cp -l "$HOME/.$rc" $backup_dir$rc
    fi
  done
}

function link(){
  read -p "are you sure? have you made a backup? [y|N] : " confirmation

  case "$confirmation" in
    Yes|yes|Y|y)
      echo "linking dotfiles from $PWD into $HOME"

      for rc in $rcs;
      do 
        if [ -f "$1/$rc" ]
        then
          mv $HOME/.$rc $HOME/x.$rc
          ln -s "$PWD/$rc" $HOME/.$rc
        fi
      done ;;
    No|no|N|n|"")
      echo -e "canceling\n"
      exit 1 ;;
    *)
      echo -e "excuse me?\n" ;;
  esac
}

function restore(){
  read -p "are you sure? have you made a backup? [y|N] : " confirmation

  case "$confirmation" in
    Yes|yes|Y|y)
      echo "copying dotfiles from $1 into $HOME"

      for rc in $rcs;
      do 
        if [ -f "$1/$rc" ]
        then
          mv $HOME/.$rc $HOME/x.$rc
          cp -l "$1/$rc" $HOME/.$rc
        fi
      done ;;
    No|no|N|n|"")
      echo -e "canceling\n"
      exit 1 ;;
    *)
      echo -e "excuse me?\n" ;;
  esac
}


function list_rcs(){

  for rc in $rcs;
  do
    ls --color=auto -lhsd $HOME/.$rc
  done

}

function update_pathogen(){
  curl https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim -o vim/autoload/pathogen.vim
}

if [ "$1" == "" ]
then
  help
elif [ $0 != "./setup.sh" ]
then
  warn "you should be calling this from within its folder"
else
  while getopts 'libshprc' OPTION ; do
    case "$OPTION" in
      l)  list_rcs;;
      b)  backup ;;
      h)  help ;;
      p)  update_pathogen ;;
      i)  restore . ;;
      s)  link . ;;
      r)  restore $backup_dir ;;
      c)  echo "Ok mache sauber danach";;
    esac
  done
fi

