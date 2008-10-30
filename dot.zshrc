##precmd () { print -Pn "%n@%m: %~" }

stty sane

#cd bin && echo `hostname` | figlet && cd
set -o vi
setopt CSH_NULL_GLOB
setopt autocd 
setopt RM_STAR_SILENT
setopt HIST_FIND_NO_DUPS
unsetopt BEEP

autoload -U compinit
compinit

# zcalc > bc
autoload -U zcalc

# Completion for man
compctl -f -x 'S[1][2][3][4][5][6][7][8][9]' -k '(1 2 3 4 5 6 7 8 9)' \
  - 'R[[1-9nlo]|[1-9](|[a-z]),^*]' -K 'match-man' \
  - 's[-M],c[-1,-M]' -g '*(-/)' \
  - 's[-P],c[-1,-P]' -c \
  - 's[-S],s[-1,-S]' -k '( )' \
  - 's[-]' -k '(a d f h k t M P)' \
  - 'p[1,-1]' -c + -K 'match-man' \
  -- man

# More completion
compctl -b bindkey
compctl -v export
compctl -o setopt
compctl -v unset
compctl -o unsetopt
compctl -v vared
compctl -c which
compctl -c -f sudo



# Completion menu
zstyle ':completion:*' menu select=1

# Completion options
zstyle ':completion:*' completer _complete _prefix
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:predict:*' completer _complete

# Completion caching
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# Expand partial paths
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'



#complete ssh hosts
local _myhosts
_myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
zstyle ':completion:*' hosts $_myhosts
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

export PATH=$PATH:/opt/local/bin:/Users/burny/bin
export PS1="%B%n %~ $ %b"
export LC_COLLATE=C
export LESS="-erX"

export EDITOR="vi"
export SVN_EDITOR=$EDITOR
#export CC="colorgcc"
#export CXX="colorgcc"


export GREP_COLOR=01
export EDITOR=vi
#export CLASSPATH=.:/usr/lib/jvm/java-6-sun/jre/lib/rt.jar
#alias	cd	'set old="$cwd"; chdir \!*'
alias .="source"
alias ls="ls -G"
alias p="ssh palmetto"
alias fink="sudo fink"
alias port="sudo port"
#alias svn="colorsvn"
#alias g++="colorgcc"
#alias gcc="colorgcc"
#alias   up="apt-get update; apt-get upgrade"
#alias   grep="grep --color"
#alias   gnome-terminal="gnome-terminal --geometry 69x15"
#alias   apt-get="sudo apt-get"
#alias   aptitude="sudo aptitude"
#alias   ifconfig="sudo ifconfig"
#alias   iwconfig="sudo iwconfig"
#alias   iwlist="sudo iwlist"
alias   vi="vim"
alias	x="exit"
#
#alias grep="grep --color"
#alias halt="sudo /sbin/halt"
#alias reboot="sudo /sbin/reboot"
#alias ZZ="sudo /sbin/shutdown -h now"
#alias xv="display"

function precmd() {
    case $TERM in
	xterm*)
    precmd () {print -Pn "\e]0;%n@%m: %~\a"}
	    ;;      
    esac    
}

alias findbad='grep -rE "(strn?c(py|at)|sprintf)" *'

alias no-precmd='function precmd() {}'
# ri
alias ri="LESS='-REXMM' ri -T -f ansi"
fg_green=$'%{\e[0;32m%}'
fg_blue=$'%{\e[0;34m%}'
fg_cyan=$'%{\e[0;36m%}'
fg_red=$'%{\e[0;31m%}'
fg_brown=$'%{\e[0;33m%}'
fg_purple=$'%{\e[0;35m%}'

fg_light_gray=$'%{\e[0;37m%}'
fg_dark_gray=$'%{\e[1;30m%}'
fg_light_blue=$'%{\e[1;34m%}'
fg_light_green=$'%{\e[1;32m%}'
fg_light_cyan=$'%{\e[1;36m%}'
fg_light_red=$'%{\e[1;31m%}'
fg_light_purple=$'%{\e[1;35m%}'
fg_no_colour=$'%{\e[0m%}'

fg_white=$'%{\e[1;37m%}'
fg_black=$'%{\e[0;30m%}'

export TERM="xterm-color"
# blogs

#rm -rf Documents
#rm -rf Desktop
#todo list
stty sane
# The following lines were added by compinstall

zstyle ':completion:*' list-colors ''
zstyle :compinstall filename '/home/stu4/s11/bjg1955/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source /sw/bin/init.sh
clear
