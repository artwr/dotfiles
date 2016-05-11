. `brew --prefix`/etc/profile.d/z.sh

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
# export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

export JAVA7_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home
export JAVA8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk/Contents/Home
export JAVA_HOME=$JAVA8_HOME
export PATH=$JAVA_HOME/bin:$PATH


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


source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh

export PS1="\[\033[01;32m\]\d \t \w\$(__git_ps1) \[\033[00m\]\$ "
export CLICOLOR=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

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

if [ -e ~/.bash_profile_private ] 
then
  source ~/.bash_profile_private
fi

source ~/.profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
eval "$(rbenv init -)"


export PATH="$PATH:/usr/local/bin:/usr/local/games/bin:/Users/Arthur/bin"

# ALIASES
# To create a new project without having to close the one currently open
alias newrstudio='open -n /Applications/RStudio.app/'
# mvim
# alias vim="mvim -v"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Haskell
export PATH="$HOME/Library/Haskell/bin:$PATH"

# Scala
export SCALA_HOME="/usr/local/share/scala"
export PATH="$PATH:$SCALA_HOME/bin"

#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad

# Go
export GOPATH=~/Code/go

