#!/bin/bash

# install links
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gitconfig ~/.gitconfig
ln -s ~/.vim/inputrc ~/.inputrc
echo "source ~/.vim/bash_global" >> ~/.bash_profile
echo "source ~/.vim/bash_global" >> ~/.bashrc

echo "Did you remember to download the vim plugins?:"
echo "git submodule init && git submodule update"
