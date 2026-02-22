return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "nvim-telescope/telescope-fzf-native.nvim",
        },
        build = "make", -- for fzf-native
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            telescope.setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    path_display = { "truncate" },
                    file_ignore_patterns = { "node_modules", ".git/" },
                    mappings = {
                        i = {
                            ["<C-n>"] = actions.cycle_history_next,
                            ["<C-p>"] = actions.cycle_history_prev,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-c>"] = actions.close,
                        },
                        n = {
                            ["q"] = actions.close,
                            ["j"] = actions.move_selection_next,
                            ["k"] = actions.move_selection_previous,
                        },
                    },
                },
                pickers = {
                    find_files = { theme = "dropdown" },
                    live_grep = { theme = "ivy" },
                    buffers = { theme = "dropdown", previewer = false },
                    help_tags = { theme = "ivy" },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                },
            })

            telescope.load_extension("fzf")

            -- Keymaps via legendary.nvim
            local legendary = require("legendary")
            legendary.keymaps({
                { "<leader>ff", "<cmd>Telescope find_files<CR>", description = "Find File" },
                { "<leader>fr", "<cmd>Telescope oldfiles<CR>",   description = "Recent Files" },
                { "<leader>ft", "<cmd>Telescope live_grep<CR>",  description = "Find Text" },
                { "<leader>fb", "<cmd>Telescope buffers<CR>",    description = "Buffers" },
                { "<leader>fh", "<cmd>Telescope help_tags<CR>",  description = "Help" },
            })
        end,
    },
}
