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