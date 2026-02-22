# My Neovim config

---

## Prerequsites
- git
- Neovim 0.10+
- Node 18+
- ripgrep
- fzf
- lua

## Installation

1. Create neovim config folder 
    ```bash 
        mkdir -p ~/.config/nvim
    ```.
2. Clone repo into neovim config folder 
    ```bash
        git clone --depth=1 https://github.com/Benson003/my_neovim_config.git ~/.config/nvim/
    ```.
3. Run the setup script 
    ```bash

     cd ~/.config/nvim
     chmod +x ./setup.sh
     ./setup.sh

    ```
4. Open neovim and let Lazy download and setup dependencies.

## After Installation

1. Run `:Lazy update` && `:Lazy sync` to update plugins.
2. Run `:Mason` and install required extnsions.
3. Run `TSInstall <language >` to install the a langauge.
