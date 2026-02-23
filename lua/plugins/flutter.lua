-- Flutter specific mappings
vim.keymap.set("n", "<leader>fr", "<cmd>FlutterRun<cr>", { desc = "Flutter Run" })
vim.keymap.set("n", "<leader>fq", "<cmd>FlutterQuit<cr>", { desc = "Flutter Quit" })
vim.keymap.set("n", "<leader>fR", "<cmd>FlutterRestart<cr>", { desc = "Flutter Hot Restart" })
vim.keymap.set("n", "<leader>fd", "<cmd>FlutterDevices<cr>", { desc = "Select Flutter Device" })
vim.keymap.set("n", "<leader>fe", "<cmd>FlutterEmulators<cr>", { desc = "Select Flutter Emulator" })

return {
    {
        "akinsho/flutter-tools.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim", -- Optional: improves the UI for selecting devices
        },
        config = function()
            require("flutter-tools").setup({
                ui = {
                    -- Uses the floating window style we discussed earlier
                    border = "rounded",
                    notification_style = "plugin", -- uses nvim-notify if you have it
                },
                decorations = {
                    statusline = {
                        device = true,
                        app_version = true,
                    },
                },
                widget_guides = {
                    enabled = true,
                },
                lsp = {
                    color_indicator = true, -- shows colors in the gutter for Flutter colors
                    settings = {
                        showTodos = true,
                        completeFunctionCalls = false,
                        analysisExcludedFolders = {
                            vim.fn.expand("$HOME/.pub-cache"),
                        },
                    },
                },
            })
        end,
    },
}
