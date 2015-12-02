
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
#   %~ The current working directory. If you are in you are in your $HOME,
#      this will be replaced by ~.
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

local BATTERY="/sys/class/power_supply/BAT0/capacity"

prompt_start() {
  echo -n "%(?::%{$fg_bold[red]%}● %s)"
  echo -n '%{$reset_color%}'
}

prompt_user() {
  if [ $UID -eq 0 ]
  then; echo -n '%{$fg[red]%}'
  else; echo -n '%{$fg[green]%}'
  fi

  if [ -n "$SSH_TTY" ] || [ $UID -eq 0 ]; then
    echo -n '%B%n%b'
    echo -n '%{$reset_color%}'
  fi

  if [ -n "$SSH_TTY" ]; then
    echo -n '@%m%b%{$reset_color%}'
    echo -n '%{$reset_color%}:'
  fi
}

prompt_dir() {
  # %~ or %c or %d
  echo -n '%{$fg[blue]%}%B%c/%b%{$reset_color%} '
}

prompt_end() {
  echo -n '%(!.#.§) '
}

prompt_default() {
  prompt_start
  prompt_user
  prompt_dir
  prompt_end
}

PROMPT=$(prompt_default)

#RPROMPT='$(git_prompt_info)[%*]'

RPROMPT='$(git_prompt_info)[%*]'
if test -e $BATTERY; then
  RPROMPT=$RPROMPT:" $(cat $BATTERY)"
fi

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="" #"%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}*%{$reset_color%}"

