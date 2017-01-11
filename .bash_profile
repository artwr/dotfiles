. `brew --prefix`/etc/profile.d/z.sh

pathappend() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

pathprepend() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1${PATH:+":$PATH"}"
    fi
}


pathprepend "/usr/local/sbin"
pathprepend "/usr/local/bin"

export JAVA8_HOME=$(/usr/libexec/java_home)
export JAVA_HOME=$(/usr/libexec/java_home)
pathappend $JAVA_HOME/bin


pathappend $HOME/bin

# Haskell
pathappend $HOME/Library/Haskell/bin

# Scala
export SCALA_HOME="/usr/local/share/scala"
pathappend $SCALA_HOME/bin

# Aliases
alias less='less -R'
alias ll='ls -lH'

alias brewski='brew update && brew upgrade --all && brew upgrade brew-cask; brew cleanup; brew cask cleanup; brew doctor'

# SSH
alias findtunnel='ps aux | grep ssh'

# Ruby
alias be='bundle exec'

# OSX
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# RStudio CLI
alias newrstudio='open -n /Applications/RStudio.app/'


function sourceifexists {
  if [ $1 ]
  then
    if [ -e $1 ]
    then
    source $1
    fi
  else
    echo "usage: sourceifexists path/to/file"
  fi
}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
fi

sourceifexists /usr/local/etc/bash_completion.d/git-completion.bash
sourceifexists /usr/local/etc/bash_completion.d/git-prompt.sh

export PS1="\[\033[01;32m\]\d \t \w\$(__git_ps1) \[\033[00m\]\$ "
export CLICOLOR=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad

# put this in your .bash_profile
if [ $ITERM_SESSION_ID ]; then
      export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

# Piece-by-Piece Explanation:
# the if condition makes sure we only screw with $PROMPT_COMMAND if we're in an iTerm environment
# iTerm happens to give each session a unique $ITERM_SESSION_ID we can use, $ITERM_PROFILE is an option too
# the $PROMPT_COMMAND environment variable is executed every time a command is run
# see: ss64.com/bash/syntax-prompt.html
# we want to update the iTerm tab title to reflect the current directory (not full path, which is too long)
# echo -ne "\033;foo\007" sets the current tab title to "foo"
# see: stackoverflow.com/questions/8823103/how-does-this-script-for-naming-iterm-tabs-work
# the two flags, -n = no trailing newline & -e = interpret backslashed characters, e.g. \033 is ESC, \007 is BEL
# see: ss64.com/bash/echo.html for echo documentation
# we set the title to ${PWD##*/} which is just the current dir, not full path
# see: stackoverflow.com/questions/1371261/get-current-directory-name-without-full-path-in-bash-script
# then we append the rest of $PROMPT_COMMAND so as not to remove what was already there
# voilà!


# PROMPT_TITLE='echo -ne "\033]0;${USER}@$mbp:${PWD/#$HOME/~}\007"'
# export PROMPT_COMMAND="${PROMPT_COMMAND} ${PROMPT_TITLE}; "

#function title {
#    echo -ne "\033]0;"$*"\007"
#}

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
export PROMPT_COMMAND='history -a; if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'


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

sourceifexists ~/.bash_profile_private
sourceifexists ~/.bashrc
sourceifexists ~/.profile

# SSH agent multiple windows

export SSH_AUTH_SOCK=$(launchctl getenv SSH_AUTH_SOCK)

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# iTerm2 tab titles
function title {
    if [ "$1" ]
    then
        export PROMPT_COMMAND='iterm2_preexec_invoke_cmd'
        echo -ne "\033]0;${*}\007"
    else
        export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007";iterm2_preexec_invoke_cmd'
    fi
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#eval "$(rbenv init -)"
