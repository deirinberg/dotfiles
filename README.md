1. Open Terminal.app 
2. Run the following:
```bash
git clone https://github.com/nitsky/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
// change .gitconfig file to your git user info
./install.sh
```
4. To add custom command paths:
```bash
cd ~
touch echo .zshrc.user
// add paths in file
```