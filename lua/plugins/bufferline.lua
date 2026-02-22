return {
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin" },
        config = function()
            local colors = require("catppuccin.palettes").get_palette()
            require("bufferline").setup({
                options = {
                    numbers = "ordinal",
                    close_command = "bdelete! %d",
                    right_mouse_command = "bdelete! %d",
                    left_trunc_marker = "",
                    right_trunc_marker = "",
                    max_name_length = 25,
                    max_prefix_length = 25,
                    tab_size = 21,
                    diagnostics = "nvim_lsp",
                    show_buffer_close_icons = true,
                    show_close_icon = false,
                    enforce_regular_tabs = false,
                    view = "multiwindow",
                    separator_style = { "", "" }, -- slanted inside edges
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "",
                            highlight = "Directory",
                            padding = 1,
                        },
                    },
                },
                highlights = {
                    fill = {
                        guifg = colors.text,
                        guibg = colors.mantle,
                    },
                    background = {
                        guifg = colors.surface2,
                        guibg = colors.mantle,
                    },
                    buffer_selected = {
                        guifg = colors.text,
                        guibg = colors.blue,
                        gui = "bold",
                    },
                    separator = {
                        guifg = colors.mantle,
                        guibg = colors.mantle,
                    },
                    separator_selected = {
                        guifg = colors.blue,
                        guibg = colors.mantle,
                    },
                    close_button = {
                        guifg = colors.surface2,
                        guibg = colors.mantle,
                    },
                    close_button_selected = {
                        guifg = colors.text,
                        guibg = colors.blue,
                    },
                },
            })
        end,
    },
}
