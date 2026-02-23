#!/bin/bash
mkdir -p ~/.local/share/nvim/lazy
git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable ~/.local/share/nvim/lazy/lazy.nvim
npm install -g tree-sitter-cli
pip install pynvim
npm install -g neovim
gem install neovim
