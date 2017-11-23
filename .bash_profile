# GERAL
function reboot_net(){
   (cd /Volumes/servidor/Dropbox/www/.reboot-roteador/ && node .reboot.js)
}

# Wordpress
alias wpinit='wp core download --locale=pt_BR'
alias wpconfig='wp core config --dbname=$1 --dbhost="127.0.0.1" --dbuser="root" --dbpass=""'
alias wpinstall='wp core install --url="http://localhost/wordpress" --title="Trinity Wordpress" --description="Testando" --admin_user="trinityweb" --admin_password="trinity" --admin_email="contato@trinityweb.com.br"'

# CODE EDUCATION
function vhomestead(){
   (cd ~/.composer/vendor/laravel/homestead && vagrant $* )
}

# GIT
alias status='git status'
alias all='git add .'
alias add='git add $1'
alias origin='git push origin master'
alias github='git push github master'
alias commit='git commit -m $1'
alias remover='git rm --cached $1'
alias log='git log'
alias pull='git pull'

# SSH
alias ssh='ssh -p22 root@$1'

# LOCALHOST

alias profile='cd ~/ && sublime .bash_profile'
alias projeto='cd /Users/mac/www/ && sublime '
alias site='cd /Users/mac/www/ && cd '
alias www='cd /Users/mac/www/'
alias son='cd ~/Code/transcricoes'
alias code='cd ~/Code'
alias back='cd ..'
alias refresh='source ~/.bash_profile'
alias lsa='ls -la'
alias h='cd ~/'
alias tw_file='find . -type f -exec chmod 644 {} \;'
alias tw_dir='find . -type d -exec chmod 755 {} \;'
alias apstart='sudo apachectl start'
alias aprestart='sudo apachectl restart'
alias apstop='sudo apachectl stop'
alias up8000='php -S localhost:8000'
alias up8080='php -S localhost:8080'

# Curiosidades


# MySQL
alias sqlon='mysql.server start'
alias sqloff='mysql.server stop'
alias sql='mysql -uroot -p'

# VARIÁVEIS DE AMBIENTE
export ANDROID_HOME=/usr/local/Cellar/android-sdk/24.4.1_1
export IUGU_API_TOKEN="bca769d6557aa3b0ce0da4ceb6ca7262"
export PATH=/Users/mac/.composer/vendor/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:/Library/Frameworks/Python.framework/Versions/3.6/bin:/usr/local/Cellar/mongodb/3.4.3/bin/mongod:${PATH}

CDPATH=.:~:~/Code/transcricoes:~/www

# PYTHON
# set where virutal environments will live
export WORKON_HOME=$HOME/.virtualenvs
# ensure all new environments are isolated from the site-packages directory
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
# use the same directory for virtualenvs as virtualenvwrapper
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export VIRTUALENVWRAPPER_PYTHON=/usr/local/Cellar/python3/3.6.1/bin/python3
# makes pip detect an active virtualenv and install to it
export PIP_RESPECT_VIRTUALENV=true
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
