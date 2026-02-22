# My Neovim config

---

## Prerequsites
- git
- Neovim 0.10+
- Node 18+
- ripgrep

## Installation

1. Create neovim config folder `mkdir -p ~/.config/nvim`.
2. Clone repo into neovim config folder `git clone --depth=1 https://github.com/Benson003/my_neovim_config.git ~/.config/nvim/`.
3. Clone and setup lazy.nvim
```
mkdir -p ~/.local/share/nvim/lazy
git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable ~/.local/share/nvim/lazy/lazy.nvim
```
3. Open neovim and let Lazy download and setup dependencies.

## After Installation

1. Run `:Lazy update` && `:Lazy sync` to update plugins.
2. Run `:Mason` and install required extnsions.
3. Run `TSInstall <language >` to install the a langauge.
