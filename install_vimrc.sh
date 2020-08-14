#!/bin/sh

set -e

cat ./persi.vimrc > ~/.vimrc
if [ `uname` == "Darwin" ]; then
    echo "\033[32m🍺 Installed the Vim configuration successfully! Enjoy :-)\033[0m"
else
    echo -e "\033[32m🍺 Installed the Vim configuration successfully! Enjoy :-)\033[0m"
fi
