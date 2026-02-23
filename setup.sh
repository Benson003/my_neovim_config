#!/bin/bash 

echo "Installing Lazy"

mkdir -p ~/.local/share/nvim/lazy/
git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable ~/.local/share/nvim/lazy/lazy.nvim
echo "Installing pynvim"
pip install pynvim 
echo "Installing gem 'neovim'" 
gem install neovim

echo "Installing tree-sitter-cli"
npm install -g tree-sitter-cli neovim

