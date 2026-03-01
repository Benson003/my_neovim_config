-- ~/.config/nvim/init.lua

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load core settings
require("config.options")
require("config.keymaps")

-- Load lazy
require("config.lazy")