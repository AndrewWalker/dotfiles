#!/bin/bash

echo "MacOSX platform specific install"

# base-path to the location that this script is being run from
BASEPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

install -d ~/.local
rm -rf ~/.local/platbin
ln -s -f $BASEPATH/bin ~/.local/platbin
