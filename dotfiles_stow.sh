#!/bin/bash

unset CDPATH

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "$DIR"
stow bash
stow vim
#stow hammerspoon
