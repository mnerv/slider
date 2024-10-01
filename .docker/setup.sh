#!/usr/bin/env sh

BASEDIR="$(readlink -f $(dirname $0))"

# git configuration
git config --global --add safe.directory /home/porter/app
git config --global core.autocrlf false

# Install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Change default shell to zsh
echo "" | chsh -s $(which zsh)

# zsh config
echo "export SHELL=$(which zsh)" >> ~/.zshrc
echo "export EDITOR=nvim" >> ~/.zshrc
echo "alias ls=exa" >> ~/.zshrc
echo "alias cat='bat -p --paging=never'" >> ~/.zshrc

# slidev setup
mkdir -p ~/.npm-global/lib
npm config set prefix ~/.npm-global
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.zshrc
npm i -g @slidev/cli @slidev/theme-default @slidev/theme-seriph

# lookatme setup
python3 -m venv .venv
source ~/.venv/bin/activate
pip install --upgrade setuptools wheel
pip install lookatme --no-build-isolation

echo 'export PATH=$HOME/.venv/bin:$PATH' >> ~/.zshrc
# echo "source ~/.venv/bin/activate" >> ~/.zshrc
