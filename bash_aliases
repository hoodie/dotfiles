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
alias ascii='./ascii'
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

# LS colors, made with http://geoff.greer.fm/lscolors/
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:*.patch=00;34:*.o=00;32:*.so=01;35:*.ko=01;31:*.la=00;33'

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

