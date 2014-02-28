#!/bin/bash

# base-path to the location that this script is being run from
BASEPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# if vundle is not installed
if [ ! -d ~/.vim/bundle/vundle ]; then
    # install vundle
    install -d ~/.vim/bundle
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

    # do an initial provisioning of vim
    bash -ic 'vim +BundleInstall +qall'
fi

# link the appropriate files into place
ln -s -f $BASEPATH/tmux/tmux.conf ~/.tmux.conf
ln -s -f $BASEPATH/git/gitconfig ~/.gitconfig
ln -s -f $BASEPATH/git/gitignore ~/.gitignore
ln -s -f $BASEPATH/vim/vimrc ~/.vimrc
ln -s -f $BASEPATH/bash/bashrc.common ~/.bashrc.common
mkdir -p ~/.pip/
ln -s -f $BASEPATH/pip/pip.conf ~/.pip/pip.conf

if grep -Fxq "source ~/.bashrc.common" ~/.bashrc 
then    
    echo "bash common already installed"
else
    echo "source ~/.bashrc.common" >> ~/.bashrc
fi

which pip > /dev/null
if [[ "$?" != "0" ]]; then
    wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py
    python get-pip.py --user
fi

# if you can't find virtualenv, go get it
which virtualenvwrapper.sh > /dev/null
if [[ "$?" != "0" ]]; then
    pip install virtualenvwrapper --user 
fi

