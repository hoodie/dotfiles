# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#
#ZSH_THEME="robbyrussell"
#ZSH_THEME="philips"
#ZSH_THEME="hendriks"
#ZSH_THEME="nanotech"
#ZSH_THEME="random"
#ZSH_THEME="nicoulaj"


# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git archlinux nyan)

source $ZSH/oh-my-zsh.sh
source ~/.bash_aliases

# Customize to your needs...

# Editor
export EDITOR=vim
export FCEDIT=vim
export VISUAL=vim                           # for crontab

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

# hendriks prompt
#   %n The username 
#   %m The computer's hostname(truncated to the first period) 
#   %M The computer's hostname 
#   %l The current tty 
#   %?  The return code of the last-run application. 
#   %# The prompt based on user privileges (# for root and % for the rest) 
#   
#   Times
#   %T System time(HH:MM) 
#   %* System time(HH:MM:SS) 
#   %D System date(YY-MM-DD) 
#   
#   Directories
#   %~ The current working directory. If you are in you are in your $HOME, this will be replaced by ~. 
#   %c irgend ne andere art
#   %d The current working directory. 
#   
#   For the options mentioned above: You can prefix an integer to show only certain parts of your working path. If you entered %1d and found yourself in /usr/bin it would show bin. This can also be done with negative integers: %-1d using the same directory as above would show /.
#     Formatting
#   
#     %U [...] %u Begin and end underlined print 
#     %B [...] %b Begin and end bold print 
#     %{ [...] %} Begin and enter area that will not be printed. Useful for setting colors. 
#     In fact, this tag forces Zsh to ignore anything inside them when making indents for the prompt as well. 
#     As such, not to use it can have some weird effects on the margins and indentation of the prompt. 
#   
if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi

PROMPT='%{$fg[$NCOLOR]%}%B%n%b%{$reset_color%}:%{$fg[blue]%}%B%c/%b%{$reset_color%} %(!.#.$) '
if [ -n "$SSH_TTY" ]; then
PROMPT='%{$fg[$NCOLOR]%}%B%n%b@%m%b%{$reset_color%}:%{$fg[blue]%}%B%c/%b%{$reset_color%} %(!.#.$) ' ;
fi
RPROMPT='$(git_prompt_info)[%*]'

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg_no_bold[red]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[blue]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"

# LS colors, made with http://geoff.greer.fm/lscolors/
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:*.patch=00;34:*.o=00;32:*.so=01;35:*.ko=01;31:*.la=00;33'


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
