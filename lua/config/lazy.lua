-- ~/.config/nvim/lua/config/lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Make sure the directory exists
if vim.fn.empty(vim.fn.glob(lazypath)) > 0 then
    print("Cloning lazy.nvim...")
    local ok = os.execute(
        "git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable --depth 1" .. lazypath
    )
    if ok ~= 0 then
        error("Failed to clone lazy.nvim. Check your network and permissions.")
    end
end

-- Prepend runtime path
vim.opt.rtp:prepend(lazypath)

-- Now lazy.nvim exists for require
require("lazy").setup({
    spec = { { import = "plugins" } },
})
