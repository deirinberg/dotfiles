#!/bin/bash

echo "installing homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "installing homebrew... done"

echo "installing homebrew packages..."
brew install git cmake node tmux vim ack hub httpie reattach-to-user-namespace
echo "installing homebrew packages... done"

echo "setting shell to zsh..."
chsh -s /bin/zsh
echo "settings shell to zsh... done"

echo "installing zprezto..."
git clone --recursive https://github.com/sorin-ionescu/prezto.git .zprezto
echo "installing zprezto... done"

echo "symlinking dotfiles"
  local backup_dir=$HOME/.dotfiles-backup
  local symlink_files=$(find ${ROOT}/symlinks -maxdepth 1 -name '*.symlink')
  local file
  for file in $symlink_files; do
    action "symlinking $file"

    local dest_file="$HOME/.$(basename $file .symlink)"
    if [ -e $dest_file ] && [ ! -L $dest_file ]; then
      mv -p $dest_file $backup_dir
    fi
    if [ -L $dest_file ]; then
      rm $dest_file
    fi

    ln -s $file $dest_file

  done
echo "symlinking dotfiles... done!"

echo "installing vim packages..."
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.sh
echo "installing vim packages... done"

echo "*** all done, close this terminal window and open a new one ***"

