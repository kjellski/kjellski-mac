# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

[[ -s "$HOME/.git-completion.bash" ]] && source ~/.git-completion.bash

#if [ "$color_prompt" = yes ]; then
if [ true ]; then
    PS1='\[\033[0m\]\[\033[1;34m\][\[\033[0m\]\w$(__git_ps1 " \[\033[1;31m\](\[\033[1;33m\]%s\[\033[1;31m\])\[\033[0m\]")\[\033[1;34m\]]\[\033[0m\]\$ \[\033[0m\]'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi
export CLICOLOR=1
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lh'
alias la='ls -lAh'
alias l='ls -CFh'
alias lh='ls -lh'
alias lg='ls -lAh | grep --color=auto' # results
alias li='ls -lAh | grep --color=auto -v' # inverted results
alias cl='clear'
alias cd..='cd ..'
alias psg='ps aux | grep '
alias screen='screen -dR'
# git aliases
alias gis='git status'
alias gic='git commit -m '
alias gia='git add -A .'
alias gip='git push'
alias gil='git log'
alias gimm='git checkout master && git merge dev && git checkout dev'
alias tg='tree $1 | ack --passthru --color '
# maven pax aliases
alias m2cip='mvn clean install pax:provision -DskipTests'
alias m2cipt='mvn clean install pax:provision '

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export PATH=$HOME/bin:$HOME/src:/usr/local/sbin:.:$PATH
export CLASSPATH=/usr/bin/java:$HOME/lib:$HOME/src/:$HOME/.lein/self-installs/leiningen-1.6.2-standalone.jar:.:$CLASSPATH
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home/
export LD_LIBRARY_PATH=/usr/lib/jvm/java-6-openjdk:$CLASSPATH

# exports all commands from ~/bin and subfolders to PATH
if [ -s "$HOME/bin" ]; then
    MAXDEPTH=2
    export PATH=$PATH:`find $HOME/bin -maxdepth $MAXDEPTH | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/\:/g'`
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`find $HOME/bin -maxdepth $MAXDEPTH | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/\:/g'`
fi

# RVM stuff
if [ -s "$HOME/.rvm" ]; then
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
    #PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
fi
