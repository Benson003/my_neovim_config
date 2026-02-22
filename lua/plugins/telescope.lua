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

            keys = {
              { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files (Ctrl+P)" },
              { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Search Text (Global)" },
              { "<leader><leader>", "<cmd>Telescope buffers<cr>", desc = "Switch Buffers" },
              { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Page" },
              { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
              { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
              { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
            },

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
                    find_files = { theme = "ivy", previewer = true },
                    live_grep = { theme = "ivy", previewer = true },
                    buffers = { theme = "ivy", previewer = true },
                    help_tags = { theme = "ivy", previewer = true },
                    git_commits = { theme = "ivy", previewer = true },
                    git_status = { theme = "ivy", previewer = true },
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
                { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files (Ctrl+P)" },
                { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Search Text (Global)" },
                { "<leader><leader>", "<cmd>Telescope buffers<cr>", desc = "Switch Buffers" },
                { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Page" },
                { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
                { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
                { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
            })
        end,
    },
}
