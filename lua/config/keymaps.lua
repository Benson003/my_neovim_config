local map = vim.keymap.set

-- Use silent = true to prevent the command line from flickering on every save
local opt = { silent = true }

-- Basic Actions (Using Lua calls for speed)
map("n", "<leader>w", "<cmd>w<cr>", opt)
map("n", "<leader>q", "<cmd>q<cr>", opt)
map("n", "<leader>x", "<cmd>x<cr>", opt)

-- Clear search and refresh the screen (Useful for our 60FPS setup)
map("n", "<leader>h", "<cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>", opt)

-- Window navigation
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-l>", "<C-w>l", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)

-- Snappy Indenting (Keeps you in visual mode while indenting)
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move lines up and down (Fast logic for Treesitter to re-parse)
map("v", "J", ":m '>+1<CR>gv=gv", opt)
map("v", "K", ":m '<-2<CR>gv=gv", opt)
