#!/bin/bash

# install links
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gitconfig ~/.gitconfig
echo ". ~/.vim/bash_global" >> ~/.bashrc

echo "Download all plugins:"
echo "git submodule init && git submodule update"
