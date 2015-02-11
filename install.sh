#!/bin/bash

# Given that my primary editor is vim, and some things are hard to do 
# without an (minimally functional) editor, install the plugins required
function install_neobundle {
    # if neobundle is not installed
    if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
        # install neobundle
        mkdir -p ~/.vim/bundle
        git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    fi
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
esac

# base-path to the location that this script is being run from
BASEPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# link the appropriate files into place
install_neobundle
ln -s -f $BASEPATH/tmux/tmux.conf ~/.tmux.conf
ln -s -f $BASEPATH/git/gitconfig ~/.gitconfig
ln -s -f $BASEPATH/git/gitignore ~/.gitignore
ln -s -f $BASEPATH/vim/vimrc ~/.vimrc
ln -s -f $BASEPATH/bash/bashrc.common ~/.bashrc.common
ln -s -f $BASEPATH/platform/$TARGET/bashrc.platform ~/.bashrc.platform

source platform/$TARGET/install.sh

if ! grep -Fxq "source ~/.bashrc.common" $SHELL_CONFIG_FILE; then
    echo "source ~/.bashrc.common" >> $SHELL_CONFIG_FILE
fi 

