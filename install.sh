#!/bin/bash

sudo apt-get install \
    python-dev \
    wget \
    libpng12-dev \
    libfreetype6-dev

# base-path to the location that this script is being run from
BASEPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# if neobundle is not installed
if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
    # install neobundle
    mkdir -p ~/.vim/bundle
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

# link the appropriate files into place
ln -s -f $BASEPATH/tmux/tmux.conf ~/.tmux.conf
ln -s -f $BASEPATH/git/gitconfig ~/.gitconfig
ln -s -f $BASEPATH/git/gitignore ~/.gitignore
ln -s -f $BASEPATH/vim/vimrc ~/.vimrc
ln -s -f $BASEPATH/bash/bashrc.common ~/.bashrc.common


if grep -Fxq "source ~/.bashrc.common" ~/.bashrc 
then    
    echo "bash common already installed"
else
    echo "source ~/.bashrc.common" >> ~/.bashrc
fi


