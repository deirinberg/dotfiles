#!/bin/bash

echo "installing homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "installing homebrew... done"

echo "installing homebrew packages..."
brew install git cmake node tmux vim ack hub httpie
brew install fortune cowsay # these are just for fun
echo "installing homebrew packages... done"

echo "setting shell to zsh..."
chsh -s /bin/zsh
echo "settings shell to zsh... done"

echo "installing zprezto..."
git clone --recursive https://github.com/sorin-ionescu/prezto.git .zprezto
echo "installing zprezto... done"

echo "symlinking dotfiles..."
files = ".aliases .functions .gitconfig .vim .vimrc .zlogin .zprezto .zpreztorc .zshrc"
for file in $files; do
  rm ~/$file
  echo "creating symlink for $file"
  ln -s "`pwd`/$file" ~/$file
done
echo "symlinking dotfiles... done"

echo "installing vim packages..."
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
./install.sh
vim +PluginInstall +qall
echo "installing vim packages... done"

echo "*** all done, close this terminal window and open a new one ***"

