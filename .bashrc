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
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\w\[\033[00m\] $ '
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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

###########################################################
####################### VALLS ALIAS #######################
###########################################################

export PATH=$HOME/.config/composer/vendor/bin:$PATH
export PKG_CONFIG_PATH=/data/tmp/oniguruma/

phpls() {
    phpbrew list
}

phps() {
    phpbrew switch "$1"
}

#DOCKER ALIASES AND FUNCTIONS
alias di='docker images'
alias dps='docker ps'
alias dpsa='docker ps -a'

alias drmi='docker rmi $(docker images -a -q)'
alias drmif='docker rmi $(docker images -a -q) -f'
alias drm='docker rm $(docker ps -a -q)'
alias drmf='docker rm $(docker ps -a -q) -f'
alias dstop='docker stop $(docker ps -a -q)'
dstart() {
    if [ $1 ]
        then
            docker start "$1"
        else
            docker start mysql-www
    fi
    
}

# GIT ALIASES AND FUNCTIONS
alias status='git status'
alias add='git add .'
alias push='git push origin master'
alias upush='git push -u origin master'
alias pull='git pull origin master'
alias deploy='git push deploy master'
alias dpush='push && deploy'
alias log='git log --pretty=format:"%h - %an, %ar : %s"'
alias remote='git remote -v'
commit() {
    git commit -m "$1"
}

# LINUX ALIASES AND FUNCTIONS
alias getkeypub='cat $HOME/.ssh/id_rsa.pub'
alias getkeypriv='cat $HOME/.ssh/id_rsa'
alias refresh='source $HOME/.bashrc'
alias profile='code $HOME/.bashrc'
alias sshconfig='code $HOME/.ssh/config'

# LOCALHOST ALIASES AND FUNCTIONS
alias www='cd $HOME/www'
alias forum='cd $HOME/forum'
alias edu='cd $HOME/codeedu'
alias son='cd $HOME/son'
alias home='cd $HOME'
go() {
    cd "$HOME/$1"
}
phpserve() {
    if [ $1 ]
        then
            php -S "localhost:$1"
        else
            php -S "localhost:8000"
    fi
}
project() {
    www && cd $1 && phpserve
}

# MYSQL ALIAS AND FUNCTIONS
alias dbwww='docker run --name "mysql-www" -v "/home/valls/shared-volumes/dbdata":/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -d mysql:5.7.31'
alias dbcursos='docker run --name "mysql-son" -v "/home/valls/shared-volumes/dbcursos":/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -d mysql:5.7.31'

alias mysql='docker exec -it mysql-www mysql -uroot -p'

consoledb() {
    docker exec -it "$1" mysql -uroot -p
}
createdb() {
    docker exec -i mysql-www mysql -uroot -proot -e "CREATE DATABASE $1" > /dev/null
}
dropdb() {
    docker exec -i mysql-www mysql -uroot -proot -e "DROP DATABASE $1" > /dev/null
}
importdb() {
    docker exec -i mysql-www mysql -uroot -proot $1 < "$HOME/dbs/$2".sql
}
exportdb() {
    docker exec -i mysql-www mysqldump -uroot -proot $1 > "$HOME/dbs/$2".sql
}
listdb() {
    docker exec -i mysql-www mysql -uroot -proot -e "SHOW DATABASES" > "$HOME/dbs/temp.txt" &&
    cat "$HOME/dbs/temp.txt"
}
