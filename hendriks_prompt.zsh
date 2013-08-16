
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

