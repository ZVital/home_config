# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'
alias rss='newsbeuter'
alias pica-pica='picocom -b115200 /dev/ttyUSB0'
alias tm='tmux attach || tmux new' 

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#export CROSS_COMPILE="/opt/OSELAS.Toolchain-2012.12.1/arm-cortexa9-linux-gnueabi/gcc-4.7.3-glibc-2.16.0-binutils-2.22-kernel-3.6-sanitized/bin/arm-cortexa9-linux-gnueabi-"
#export CCPREFIX="/opt/OSELAS.Toolchain-2011.11.1/arm-cortexa9-linux-gnueabi/gcc-4.6.2-glibc-2.14.1-binutils-2.21.1a-kernel-2.6.39-sanitized/bin/arm-cortexa9-linux-gnueabi-"
#export CCPREFIX="/opt/OSELAS.Toolchain-2012.12.1/arm-cortexa8-linux-gnueabihf/gcc-4.7.3-glibc-2.16.0-binutils-2.22-kernel-3.6-sanitized/bin/arm-cortexa8-linux-gnueabihf-"
#export CROSS_COMPILE="/opt/OSELAS.Toolchain-2011.11.1/arm-cortexa9-linux-gnueabi/gcc-4.6.2-glibc-2.14.1-binutils-2.21.1a-kernel-2.6.39-sanitized/bin/arm-cortexa9-linux-gnueabi-"
#export CROSS_COMPILE="/opt/OSELAS.Toolchain-2012.12.1/arm-cortexa8-linux-gnueabihf/gcc-4.7.3-glibc-2.16.0-binutils-2.22-kernel-3.6-sanitized/bin/arm-cortexa8-linux-gnueabihf-"
#export PATH=${PATH}:/opt/OSELAS.Toolchain-2011.11.1/arm-cortexa9-linux-gnueabi/gcc-4.6.2-glibc-2.14.1-binutils-2.21.1a-kernel-2.6.39-sanitized/bin
#export ARCH=arm
#export PATH=${PATH}:~/android-sdk-linux/tools
#export PATH=${PATH}:~/android-sdk-linux/platform-tools

#Чтобы одинаковые команды не сохранялись в истории, добавьте строчку:
HISTCONTROL="ignoredups"
#Не добавлять запись в историю команд, если команда начинается с пробела:
HISTCONTROL="ignorespace"
#стираются все повторения, в том числе идущие не подряд, но в разной последовательности. (например, после cd..ls..cd..ls останется cd и ls)
HISTCONTROL="erasedups"
# Чтобы история команд сохранялась сразу после ввода (а не во время закрытия терминала)
shopt -s histappend
export HISTCONTROL=ignoreboth:erasedups
PROMPT_COMMAND='history -a'

export TERMINAL=xfce4-terminal

#export http_proxy="http://proxy.sam-solutions.net:8080/"
#export https_proxy="http://proxy.sam-solutions.net:8080/"
#export no_proxy="192.168.*; bbase; *.sam-solutions.net"

shopt -s cdspell

##uncomment the following to activate bash-completion:
#[ -f /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion
#-----------PS1-----------
#get_hdtemp ()
#{
#       echo -n `/sbin/hddtemp /dev/hda -n`
#}
get_sdtemp ()
{
        echo -n `/usr/sbin/hddtemp /dev/sda -nq`
}
get_freemem ()
{
        echo -n `free | grep Mem | awk '{ print $4 }'`
}
export CYAN='\[\033[36m\]'
export COLOR='\[\033[32m\]'
export NORMAL='\[\033[0m\]'
#export PS1="$NORMAL=($COLOR\u@\h$NORMAL)=($COLOR\w$NORMAL)=($COLOR\t$NORMAL)=($COLOR"'`get_freemem`'"$NORMAL)=($COLOR\j:\$?$NORMAL)=$COLOR\$$NORMAL>$COLOR"
export PS1="$NORMAL.-($COLOR\u$CYAN@\h$NORMAL):($COLOR\w$NORMAL):($COLOR"'`get_freemem`'"$NORMAL)-\n'-($COLOR\j:\$?$NORMAL):$COLOR\$$NORMAL>"
#-----------END-----------
#bashcomp
#source /etc/profile.d/bash-completion.sh
