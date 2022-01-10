#!/bin/sh

echo "Setting up your WSL..."

sudo apt update
sudo apt upgrade -y

# =============================================================================
# Install linux packages
# =============================================================================
sudo apt install tree
sudo apt install bat
sudo apt install wget ca-certificates
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# neovim
sudo apt install neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# =============================================================================
# Python
# =============================================================================

# Install pyenv
sudo apt install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
curl https://pyenv.run | bash
exec $SHELL
pyenv install 3.7.12
pyenv rehash
pyenv install 3.8.12
pyenv rehash
pyenv install 3.9.9
pyenv rehash
pyenv install 3.10.1
pyenv rehash

# Configure pyenv defaults and upgrade pip
pyenv global 3.10.1
pyenv rehash
exec $SHELL
python -m pip install --upgrade pip
pip install wheel

# pipx
pip install pipx
pipx ensurepath
pipx install black
pipx install flake8

# Create default python virtual environments
mkdir ~/.virtualenvs
python -m venv ~/.virtualenvs/py310
source ~/.virtualenvs/py310/bin/activate
python -m pip install --upgrade pip
pip install wheel
pip install jupyterlab pandas dash streamlit rich typer

# Set up poetry
curl -sSL https://install.python-poetry.org | python3 -

# Copy .bashrc_template into .bashrc
echo "" >> ~/.bashrc
echo "" >> ~/.bashrc
cat .bashrc_template >> ~/.bashrc

# Complete!
exec $SHELL
echo "Complete!"
