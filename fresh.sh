#!/bin/sh

echo "Setting up your WSL..."

sudo apt update
sudo apt upgrade -y

# Install linux packages
sudo apt install build-essential # Required to build python and use pyenv.
sudo apt install tree
sudo apt install bat
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# Install python tools
curl https://pyenv.run | bash

echo 'eval "$(starship init bash)"' >> .bashrc
