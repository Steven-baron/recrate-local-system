!#/usr/bin/env bash

set -e

echo "installing core tools..."

sudo apt update
sudo apt install -y

git \
  stow \
  zsh \
  tmxu \
  neovim \
  curl \
  wget \
  unzip \
  fzf \
  ripgrep \
  fd-find

echo "Installing lazygit..."
LAZYGIT_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz

echo "Done."
