#!/bin/bash

set -ue

function deploy 
{
    SRC=$1
    DST=$2
    ln -s -f $SRC $DST
}

case $OSTYPE in
    linux-gnu)
        TARGET=ubuntu
        SHELL_CONFIG_FILE="$HOME/.bashrc"
        ;;
    darwin14)
        TARGET=osx
        SHELL_CONFIG_FILE="$HOME/.bash_profile"
        ;;
    darwin15)
        TARGET=osx
        SHELL_CONFIG_FILE="$HOME/.bash_profile"
        ;;
esac

# base-path to the location that this script is being run from
BASEPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# link the appropriate files into place
deploy $BASEPATH/tmux/tmux.conf ~/.tmux.conf
deploy $BASEPATH/git/gitconfig ~/.gitconfig
deploy $BASEPATH/git/gitignore ~/.gitignore
deploy $BASEPATH/bash/bashrc.common ~/.bashrc.common
deploy $BASEPATH/platform/$TARGET/bashrc.platform ~/.bashrc.platform
deploy $BASEPATH/vim/vimrc ~/.vimrc
deploy $BASEPATH/vim/vimspell.add ~/.vimspell.add
deploy $BASEPATH/haskell/ghci.conf ~/.ghci.conf
rm -rf ~/.vim
deploy $BASEPATH/vim/vim ~/.vim

source platform/$TARGET/install.sh

if ! grep -Fxq "source ~/.bashrc.common" $SHELL_CONFIG_FILE; then
    echo "source ~/.bashrc.common" >> $SHELL_CONFIG_FILE
fi 

