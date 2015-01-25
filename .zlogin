WHOAMI=$(whoami)
if tmux has-session -t $WHOAMI 2>/dev/null; then
  tmux -2 attach-session -t $WHOAMI
else
  tmux -2 new-session -s $WHOAMI
fi
fortune | cowsay
