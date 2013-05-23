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
alias st='open -a SourceTree'
# maven pax aliases
alias m2cip='mvn clean install pax:provision -DskipTests'
alias m2cipt='mvn clean install pax:provision '
alias nw='open -n -a node-webkit .'

alias hibernate_off='sudo pmset -a hibernatemode 3'
alias hibernate_on='sudo pmset -a hibernatemode 1'

alias pull='git pull --rebase'
alias httpserver='python -m SimpleHTTPServer'

