-- ~/.config/nvim/lua/config/lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Make sure the directory exists
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Now lazy.nvim exists for require
require("lazy").setup({
	spec = { { import = "plugins" } },
	ui = {
		border = "rounded",
	},
})
