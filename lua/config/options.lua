local opt = vim.opt
local api = vim.api

api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.dart",
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})
opt.number = true
opt.relativenumber = true
opt.laststatus = 3
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false

opt.list = true
vim.opt.listchars = {
	tab = "→ ", -- Shows a tab as an arrow
	trail = "·", -- Shows trailing spaces at the end of a line as dots
	nbsp = "␣", -- Shows non-breaking spaces
}

opt.clipboard = "unnamedplus"
opt.swapfile = false

opt.smartindent = true

opt.termguicolors = true
opt.cursorline = true

opt.splitright = true
opt.splitbelow = true

opt.ignorecase = true
opt.smartcase = true

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.signcolumn = "yes"

-- UI Polish
opt.termguicolors = true -- You have this, keep it!
opt.cursorline = true -- Highlighting the line helps focus

-- Smoothing the Render
opt.fillchars = { eob = " " } -- Clean up the end-of-buffer ~ tildes
opt.mouse = "a" -- Enable mouse for easier scrolling/resizing
