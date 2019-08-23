#!/bin/bash
DOTPATH=$HOME/dotfiles/

exists(){
    type "$1" &> /dev/null
    return $?
}

download(){
    if [ -d "$DOTPATH" ]; then
        echo "already exists"
    fi
}
