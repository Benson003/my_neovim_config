return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = 20,
                open_mapping = [[<C-\>]],
                hide_numbers = true,
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                insert_mappings = true,
                persist_size = true,
                direction = "float", -- options: 'vertical', 'horizontal', 'float', 'tab'
                close_on_exit = true,
                float_opts = {
                    border = "curved", -- rounded border
                    winblend = 0,
                    highlights = {
                        border = "Normal",
                        background = "Normal",
                    },
                },
            })

            -- Optional: helper functions to toggle terminals quickly
            local Terminal = require("toggleterm.terminal").Terminal
            local lazyterm = Terminal:new({ cmd = "lazygit", hidden = true })

            function _LAZYGIT_TOGGLE()
                lazyterm:toggle()
            end

            vim.api.nvim_set_keymap(
                "n",
                "<leader>g",
                "<cmd>lua _LAZYGIT_TOGGLE()<CR>",
                { noremap = true, silent = true }
            )
        end,
    },
}
