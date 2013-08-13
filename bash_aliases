#!/bin/bash

test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

#colors
     NC='\033[0m'      # no color
    red='\e[0;31m'
    RED='\e[1;31m'
   blue='\e[0;34m'
   BLUE='\e[1;34m'
   cyan='\e[0;36m'
   CYAN='\e[1;36m'
  black='\e[0;30m'
  BLACK='\e[1;30m'
  green='\e[0;32m'
  GREEN='\e[1;32m'
 purple='\e[0;33m'
 PURPLE='\e[1;33m'
magenta='\e[0;35m'
MAGENTA='\e[1;35m'
  white='\e[0;37m'
  WHITE='\e[1;37m'
lightgreen='\e[0;92m'
LIGHTGREEN='\e[1;92m'

## Moving around & all that jazz
alias go='kde-open'
alias calm='cal -m'
alias back='cd $OLDPWD'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias cd..="cd .." #work around a common typo
alias cdd="cd ~/Desktop && ls -h"
alias cds="pwd | sed 's/ /\\\ /g' > ~/.cdo"   # save current dir location
alias cdo='cat ~/.cdo; cd $(cat ~/.cdo)'                   # cd  to saved dir location
function cdl(){ cd $1; ls ;}
alias l='ls'
alias lsd='ls -d */'
alias ls='ls --color=auto --group-directories-first'
alias lash='ls -lash'
#alias ssh='autossh'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias pc='proxychains'

alias sbash="source ~/.bashrc"

alias monoplayer="mplayer -af pan=1:0.5:0.5 -channels 1"
alias ramdisk='[ -d ~/Desktop/ram ] || mkdir ~/Desktop/ram && sudo mount -t tmpfs none ~/Desktop/ram && df | grep none '
#alias serve='python2 -m SimpleHTTPServer'
alias serve='python -m http.server'
alias suserve='sudo python2 -m SimpleHTTPServer 80'
alias tmux='tmux -2'

# a grep for every occasion
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias gr='find . | grep -v .svn | xargs grep -Isn --color=auto'
alias cgr='find . -iname \*.c | grep -v .svn | xargs grep -Isn --color=auto'
alias hgr='find . -iname \*.h | grep -v .svn | xargs grep -Isn --color=auto'
alias grepmail="grep -Eio '\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b'"

alias du="du -h"
alias df="df -h"

alias sv="sudo vim -p"    # open in tab
alias v="vim -p"          
alias vi="vim"
alias :e=vim
alias :q=exit
alias sudi='sudo -i'
alias vcat='mencoder -oac copy -ovc copy -o'
alias pwdend='pwd | awk -F"/" "{print \$NF}"'
alias svnpull='git svn rebase'
alias svnpush='git svn rebase ; git svn dcommit'


# System
alias chot="sudo chown -R"
alias chx="chmod +x"
alias cron="crontab -e"

# Functions
function warn(){ echo -e ${RED}! ${NC}${red}$*${NC} ; }
function info(){ echo -e ${BLUE}! ${NC}${blue}$*${NC} ; }
function pass(){ echo -e ${WHITE}! ${NC}${white}$*${NC} ; }

function mkcd() { mkdir -p "$@" && cd "$_"; }

function wmp2ogg() { find . -iname '*wma' \( -exec ffmpeg -i {} -acodec vorbis -aq 5  {}.ogg \; \);  }
function ogg2mp3() { find . -iname '*ogg' \( -exec ffmpeg -i {} -acodec mp3    -aq 1  {}.mp3 \; \);  }

function e() {
  VIMARGS="--servername vimsrv --remote-silent"
  vim $VIMARGS $@;
}

# to hell with shortlinks
function resolve(){ curl -Is $1 | sed -n 's/^Location: //ip'; }

function color_palett(){
for j in 3 4 9 10;
do
  for i in `seq 0 7`; do echo -en "\e[0;${j}${i}m ${j}${i}█"; echo -en "\e[1;${j}${i}m█ "; done;
    echo -e "\e[0;m\n";
done;
}
function text_color_palett(){
echo -e \
$red█ \
$RED█ \
$blue█ \
$BLUE█ \
$cyan█ \
$CYAN█ \
$black█ \
$BLACK█ \
$green█ \
$GREEN█ \
$lightgreen█ \
$LIGHTGREEN█ \
$purple█ \
$PURPLE█ \
$magenta█ \
$MAGENTA█ \
$white█ \
$WHITE█ \
$NC█
}

function extract () {
  if [ -f $1 ] ; then
    case $1 in
			*.tar.bz2)   tar xvjf $1    ;;
			*.tar.gz)    tar xvzf $1    ;;
			*.bz2)       bunzip2 $1     ;;
			*.rar)       rar x $1       ;;
			*.gz)        gunzip $1      ;;
			*.tar)       tar xvf $1     ;;
			*.tbz2)      tar xvjf $1    ;;
			*.tgz)       tar xvzf $1    ;;
			*.zip)       unzip $1       ;;
			*.Z)         uncompress $1  ;;
			*.7z)        7z x $1        ;;
			*)           echo "don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

# get mad cli skillz
function cmdfu(){ 
  curl "http://www.commandlinefu.com/commands/matching/$@/$(echo -n $@ | openssl base64)/plaintext" --silent | sed "s/\(^#.*\)/\x1b[32m\1\x1b[0m/g" 
}

## Pacman aliases ## {{{
#if necessary, replace 'pacman' with your favorite AUR helper and adapt the commands accordingly
alias pac="sudo /usr/bin/pacman -S"		# default action	- install one or more packages
alias pacu="sudo /usr/bin/pacman -Syu"		# '[u]pdate'		- upgrade all packages to their newest version
alias pacr="sudo /usr/bin/pacman -Rs"		# '[r]emove'		- uninstall one or more packages
alias pacs="/usr/bin/pacman -Ss"		# '[s]earch'		- search for a package using one or more keywords
alias paci="/usr/bin/pacman -Si"		# '[i]nfo'		- show information about a package
alias paclo="/usr/bin/pacman -Qdt"		# '[l]ist [o]rphans'	- list all packages which are orphaned
alias pacc="sudo /usr/bin/pacman -Scc"		# '[c]lean cache'	- delete all not currently installed package files
alias paclf="/usr/bin/pacman -Ql"		# '[l]ist [f]iles'	- list all files installed by a given package
alias pacexpl="/usr/bin/pacman -D --asexp"	# 'mark as [expl]icit'	- mark one or more packages as explicitly installed 
alias pacimpl="/usr/bin/pacman -D --asdep"	# 'mark as [impl]icit'	- mark one or more packages as non explicitly installed


# download pdfs from website
function getslides() {
	curl "$1"  --silent | sed -n 's|.*href="\([^"]*\)".*|\1|p'  | grep pdf | xargs wget -nc -P "$2"
}

