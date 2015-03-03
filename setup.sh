#!/bin/bash

echo "installing homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "installing homebrew... done"

echo "installing homebrew packages..."
brew install git cmake node tmux vim ack hub httpie reattach-to-user-namespace
brew install fortune cowsay # these are just for fun
echo "installing homebrew packages... done"

echo "setting shell to zsh..."
chsh -s /bin/zsh
echo "settings shell to zsh... done"

echo "installing zprezto..."
git clone --recursive https://github.com/sorin-ionescu/prezto.git .zprezto
echo "installing zprezto... done"

echo "symlinking dotfiles..."
mkdir -p .vim/bundle
files=".aliases .functions .gitconfig .tmux.conf .vim .vimrc .zlogin .zprezto .zpreztorc .zshrc"
for file in $files; do
  rm ~/$file
  echo "creating symlink for $file"
  ln -s "`pwd`/$file" ~/$file
done
echo "symlinking dotfiles... done"

echo "installing vim packages..."
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.sh
echo "installing vim packages... done"

echo "*** all done, close this terminal window and open a new one ***"

