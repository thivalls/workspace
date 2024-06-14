export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Alias
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

alias home='cd ~'
alias ws='cd ~/workspace'
alias projects='cd ~/workspace/projects'
alias food2c='cd ~/workspace/projects/food2c'
alias gestao='cd ~/workspace/projects/personal/gestao-loc'
alias refresh='source ~/.bashrc'

# Functions
kill_port() {
    local port=$1
    if [ -z "$port" ]; then
        echo "Usage: kill_process_on_port <port>"
        return 1
    fi
    echo "Killing process on port $port..."
    lsof -t -i :$port | xargs kill -9
}

# Editions
alias profile='code ~/.bashrc'
alias me='code ~/.me'

# Docker
alias di='docker images'
alias dps='docker ps'
alias dpsa='docker ps -a'

alias drmi='docker rmi $(docker images -a -q)'
alias drmif='docker rmi $(docker images -a -q) -f'
alias drm='docker rm $(docker ps -a -q)'
alias drmf='docker rm $(docker ps -a -q) -f'
alias dsa='docker stop $(docker ps -a -q)'

###########################################################
####################### PHP MANAGER #######################
###########################################################

# phpls() {
#     phpbrew list
# }

# phps() {
#     phpbrew switch "$1"
# }
