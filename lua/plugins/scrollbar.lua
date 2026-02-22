return {
    {
        "echasnovski/mini.nvim",
        version = false, -- always latest
        config = function()
            local ok, mini_scroll = pcall(require, "mini.scroll")
            if not ok then return end

            mini_scroll.setup({
                scroll = {
                    handle = "▏", -- vertical handle
                },
                excluded_filetypes = {
                    "alpha",           -- dashboard
                    "cmp_menu",        -- nvim-cmp popup
                    "lazy",            -- lazy.nvim UI
                    "NvimTree",        -- file explorer
                    "TelescopePrompt", -- telescope prompt
                },
            })
        end,
    },
}
