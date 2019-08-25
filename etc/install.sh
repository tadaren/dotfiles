#!/bin/bash
DOTPATH=$HOME/dotfiles/
DOTFILES_REPOSITORY="https://github.com/tadaren/dotfiles.git"

exists(){
    type "$1" &> /dev/null
    return $?
}

download(){
    if [ -d "$DOTPATH" ]; then
        echo "already exists"
    fi

    dotfiles_archive="https://github.com/tadaren/dotfiles/archive/master.tar.gz"
    if exists "git"; then
        git clone --recursive "$DOTFILES_REPOSITORY" "$DOTPATH"
    elif exists "curl"; then
        crul -L "$tar" | tar xvz
    elif exists "wget"; then
        wget -O - "$tar" | tar xvz
    fi

    if [ -d "dotfiles-master"]; then
        mv "dotfiles-master" "$DOTPATH"
    fi
}

deploy(){
    cd "$DOTPATH"
    make deploy
}

main(){
    download && deploy
}
