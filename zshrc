#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

export EDITOR=jpico
export PAGER=less
#export LESS='-M'
export LESS=-R git grep
export BLOCKSIZE=K

export HISTSIZE=5000
export SAVEHIST=5000
export HISTFILE=~/.history

#export LOCKPRG=/usr/bin/vlock

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

########## Watch ##########

#watch=( $(<~/.friends) )  ## watch for people in $HOME/.friends file
#watch=(notme)
#LOGCHECK=60

## The format of login/logout reports if the watch parameter is set.
## Default is %n has %a %l from %m'.
## Recognizes the following escape sequences:
## %n = name of the user that logged in/out.
## %a = observed action, i.e. "logged on" or "logged off".
## %l = line (tty) the user is logged in on.
## %M = full hostname of the remote host.
## %m = hostname up to the first .'.
## %t or %@ = time, in 12-hour, am/pm format.
## %w = date in ay-dd' format.
## %W = date in m/dd/yy' format.
## %D = date in y-mm-dd' format.
WATCHFMT='%n %a %l from %m at %T.'

## set prompts ####
## choose just one
#PS1=$'%{\e[0;36m%}%n%{\e[0m%}:%{\e[0;31m%}%3~%{\e[0m%}%# ' ## user:~%
#PS1=$'%{\e[0;36m%}%n%{\e[0m%}:%{\e[0;31m%}%3~%{\e[0m%}%B>%b ' ## user:~>
#PS1='%n@%m:%4c%1v> ';RPS1=$'%{\e[0;36m%}%D{%A %T}%{\e[0m%}' ## user@host:~> ; Day time(hh:mm:ss)
#PS1='%B[%b%n%B:%b%~%B]%b$ ' ## [user:~]$
#PS1=$'%{\e[0;36m%}%n%{\e[0m%}:%20<..<%~%B>%b ' ## user:..c/vim-common-6.0>
#PS1=$'%{\e[0;36m%}%#%{\e[0m%} ';RPS1=$'%{\e[0;31m%}%~%{\e[0m%}' ## % ; ~
#PS1=$'%{\e[0;36m%}%n%{\e[0m%}%{\e[0;31m%}%#%{\e[0m%} ';RPS1=$'%{\e[0;31m%}%~%{\e[0m%}' ## user% ; ~
#PS1='%# ';RPS1='%B%~%b' ## % ; ~ : no colors
#PS1='%n@%m:%B%~%b> ' ## user@host:~> : no colors
#export PROMPT=$'%n@%m %(0?..%{\e[0;31m%}%?)%(1j.%{\e[0;32m%}%j.)%{\e[0;33m%}%16<...<%~%<<%{\e[0;36m%}%#%{\e[0m%} '

source ~/dotfiles/zsh/git-prompt/zshrc.sh
export PROMPT=$'%n@%m %(0?..%{\e[0;31m%}%?)%(1j.%{\e[0;32m%}%j.)%{\e[0;33m%}%16<...<%~%<<%{\e[0;36m%}%#%{\e[0m%} $(git_super_status)'

## or use neat prompt themes included with zsh
autoload -U promptinit
promptinit
## Currently available prompt themes:
## adam1 adam2 bart bigfade clint elite2 elite
## fade fire off oliver redhat suse walters zefram
#prompt elite2

## don't ask me 'do you wish to see all XX possibilities' before menu selection
LISTPROMPT=''

## SPROMPT - the spelling prompt
SPROMPT='zsh: correct '%R' to '%r' ? ([Y]es/[N]o/[E]dit/[A]bort) '


# autoload -U colors
#colors

export PATH=/usr/local/pgsql/bin:$HOME/bin:/bin:/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/games:/usr/scripts:/usr/sbin:/sbin:/usr/local/bin:/usr/X11R6/bin:~/.local/bin
export NNTPSERVER=news.song.fi
export MANPATH=/usr/man:/usr/local/man:/usr/share/man:/usr/local/lib/perl5/man:/usr/X11R6/man
export LD_LIBRARY_PATH=/usr/local/lib/:/usr/X11R6/lib/
#export LC_CTYPE=fi_FI@euro
export LC_CTYPE=fi_FI.UTF8
#export LC_CTYPE=C
export LC_LANG=C
export nobeep=yes
export CVS_RSH=ssh
stty intr ^C susp ^Z
stty isig ixon

# Let's see if this is more straightforward than carrying around the configfile
alias micro='TERM=xterm-256color micro -mouse false'

alias sshio='ssh -o IdentitiesOnly=yes'

# Autocompletes
if which aws_zsh_completer.sh > /dev/null 2>&1
then
  source $(which aws_zsh_completer.sh)
fi
