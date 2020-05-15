#!/bin/bash
[ ! -f ~/.gitconfig ] && ln -s ~/.vim/gitconfig ~/.gitconfig
[ ! -f ~/.inputrc ] && ln -s ~/.vim/inputrc ~/.inputrc
echo "source ~/.vim/bashrc" >> ~/.bashrc
echo "source ~/.vim/zshrc" >> ~/.zshrc
