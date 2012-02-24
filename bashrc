  # ~/.bashrc: executed by bash(1) for non-login shells.


  # Check for an interactive session
  [ -z "$PS1" ] && return

  if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

#echo -ne "\e[1;34m";uptime
if [ $USER == "root" ]
then
  name_color=${RED}
else
  name_color=${lightgreen}
fi

longps(){
  PS1="${name_color}\u${white}:${BLUE}\w${NC}\$ "
}
shortps(){
  PS1="${name_color}\u${white}:${blue}\W${NC}\$ "
}

shortps

[ $USER == 'root' ]	&& PS1="${red}\u${white}:${blue}\w${white}\$ "
PS2="${NC}--> ${white}"

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
HISTSIZE=1000
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth


# append to the history file, don't overwrite it
shopt -s histappend


# Functions
mkcd() { mkdir -p "$@" && cd "$_"; }
vcp() { find $1/ \( -type d -exec mkdir -p $2/{}  \; \) -o \( -type f -exec ln {} $2/{}  \; \); }
wmp2ogg() { find . -iname '*wma' \( -exec ffmpeg -i {} -acodec vorbis -aq 5  {}.ogg \; \);  }
#resolve() { curl -Is $1 | egrep "Location" | sed "s/Location: \(.*\)/\1/g"; }
resolve(){ curl -Is $1 | sed -n 's/^Location: //p'; }
extract () {
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
cmdfu(){ 
  curl "http://www.commandlinefu.com/commands/matching/$@/$(echo -n $@ | openssl base64)/plaintext" --silent | sed "s/\(^#.*\)/\x1b[32m\1\x1b[0m/g" 
}

pacs() {
	local CL='\\e['
		local RS='\\e[0;0m'

		echo -e "$(pacman -Ss "$@" | sed "
		/^core/		s,.*,${CL}1;31m&${RS},
		/^extra/	s,.*,${CL}0;32m&${RS},
		/^community/	s,.*,${CL}1;35m&${RS},
		/^[^[:space:]]/	s,.*,${CL}0;36m&${RS},
		")"
}

getslides() {
	#curl $1  --silent | sed -n 's|.*href="\([^"]\*\)".*|\1|p'  | grep pdf | xargs wget -nc -P "$2"
	curl "$1"  --silent | sed -n 's|.*href="\([^"]*\)".*|\1|p'  | grep pdf | xargs wget -nc -P "$2"
}


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f /etc/bash_completion.d ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Flex-Geraffel
export HISTCONTROL=ignoredups
export EDITOR="vim"
export FLEX_HOME=/opt/flex-sdk
export PATH=$PATH:$FLEX_HOME/bin/
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # Load RVM into a shell session *as a function*

