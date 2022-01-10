#!/bin/sh

echo "Setting up your WSL..."

sudo apt update
sudo apt upgrade -y

# Install linux packages
sudo apt install tree
sudo apt install bat
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# =============================================================================
# Python
# =============================================================================

# Install pyenv
sudo apt install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
curl https://pyenv.run | bash
pyenv install 3.7.12
pyenv install 3.8.12
pyenv install 3.9.9
pyenv install 3.10.1

# Configure pyenv defaults and upgrade pip
pyenv global 3.10.1
pyenv rehash
python -m pip install --upgrade pip
pip install wheel
pip install pipx

# Create default python virtual environments
mkdir ~/.virtualenvs
python -m venv ~/.virtualenvs/py310
source ~/.virtualenvs/py310/bin/activate
python -m pip install --upgrade pip
pip install wheel
pip install jupyterlab pandas dash streamlit

# Set up poetry
curl -sSL https://install.python-poetry.org | python3 -

