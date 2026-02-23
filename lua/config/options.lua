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
  tab = '→ ',    -- Shows a tab as an arrow
  trail = '·',   -- Shows trailing spaces at the end of a line as dots
  nbsp = '␣',    -- Shows non-breaking spaces
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

-- Performance & Redraw (The 60 FPS Secret)
opt.updatetime = 16    -- Register changes every 16ms (60Hz)
opt.redrawtime = 10000 -- Allow more time for complex TS highlights before timing out
opt.ttimeoutlen = 10   -- Speed up keycode timeouts (feels snappier)
opt.lazyredraw = false -- MUST be false for Treesitter; true can cause ghosting/lag

-- UI Polish
opt.termguicolors = true -- You have this, keep it!
opt.cursorline = true    -- Highlighting the line helps focus

-- Smoothing the Render
opt.fillchars = { eob = " " } -- Clean up the end-of-buffer ~ tildes
opt.mouse = "a"               -- Enable mouse for easier scrolling/resizing
-- Ensure cursor updates are prioritized in the render loop
opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
