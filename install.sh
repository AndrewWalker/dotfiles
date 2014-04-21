#!/bin/bash

function installpip {
    which pip > /dev/null
    if [[ "$?" != "0" ]]; then
        wget -c https://raw.github.com/pypa/pip/master/contrib/get-pip.py
        python get-pip.py --user
    fi
}

sudo apt-get install \
    python-dev \
    wget \
    libpng12-dev \
    libfreetype6-dev

# we need to temporarily add this so that if this is happening for the
# very first time we can find pip and virtualenv even without a bashrc
# file
PATH=$PATH:~/.local/bin

rm -f ~/.pip/pip.conf

installpip
pip install --upgrade pip wheel virtualenvwrapper --user

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
mkdir -p ~/.pip/
ln -s -f $BASEPATH/pip/pip.conf ~/.pip/pip.conf

pip wheel -r python/requirements.txt
pip install -r python/requirements.txt --user


if grep -Fxq "source ~/.bashrc.common" ~/.bashrc 
then    
    echo "bash common already installed"
else
    echo "source ~/.bashrc.common" >> ~/.bashrc
fi


