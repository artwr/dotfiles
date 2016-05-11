. `brew --prefix`/etc/profile.d/z.sh

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

export JAVA7_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home
export JAVA8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home
export JAVA_HOME=$JAVA8_HOME
export PATH=$JAVA_HOME/bin:$PATH


export PATH="$PATH:/usr/local/bin:/usr/local/games/bin:/Users/Arthur/bin"

# Haskell
export PATH="$HOME/Library/Haskell/bin:$PATH"

# Scala
export SCALA_HOME="/usr/local/share/scala"
export PATH="$PATH:$SCALA_HOME/bin"

# Go
export GOPATH=~/Code/go


# Aliases
alias less='less -R'
alias ll='ls -lH'

# SSH
alias findtunnel='ps aux | grep ssh'

# Ruby
alias be='bundle exec'

# OSX
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# RStudio CLI
alias newrstudio='open -n /Applications/RStudio.app/'


source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh

export PS1="\[\033[01;32m\]\d \t \w\$(__git_ps1) \[\033[00m\]\$ "
export CLICOLOR=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad

#Virtualenv wrapper setup
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Code
source /usr/local/bin/virtualenvwrapper.sh

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# cd ../*dirname*
# cd ../../*dirname*
# cd ../../../*dirname*
# All the way to the root dir.
function over {
  if [ $1 ]
  then
    olddir=$PWD
    while [ $PWD != '/' ]; do
      cd ..
      for dir in `find . -maxdepth 1 -type d -name "*$1*"`; do
        cd $dir
        break 2
      done
    done
    if [ $PWD == '/' ]; then
      echo $1: not found
      cd $olddir
    fi
  else
    echo "usage: over partial-dir-name"
  fi
}


# bash profile perso
if [ -e ~/.bash_profile_private ]
then
  source ~/.bash_profile_private
fi

source ~/.profile

# SSH agent multiple windows

start_agent(){
    get_vars="$(ssh-agent -s)";
    echo $get_vars > ~/.current_agent.sh
    source ~/.current_agent.sh
}

source ~/.current_agent.sh

cag(){
    source ~/.current_agent.sh
}


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
eval "$(rbenv init -)"
