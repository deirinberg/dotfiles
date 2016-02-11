source "$HOME/.zprezto/init.zsh"
source "$HOME/.functions"
source "$HOME/.aliases"

# source user zshrc
if [ -f "$HOME/.zshrc.user" ]; then
  source "$HOME/.zshrc.user"
fi
