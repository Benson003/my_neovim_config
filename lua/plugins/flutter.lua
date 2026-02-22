return {
    {
        "akinsho/flutter-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("flutter-tools").setup({
                ui = {
                    border = "rounded",
                    notification_style = "minimal",
                },
                decorations = {
                    statusline = {
                        app_version = true,
                        device = true,
                    },
                },
                lsp = {
                    color = { enabled = true },
                    on_attach = function(client, bufnr)
                        -- Optional keymaps for Flutter
                        local wk = require("which-key")
                        wk.register({
                            ["<leader>f"] = {
                                r = { "<cmd>FlutterRun<CR>", "Run App" },
                                h = { "<cmd>FlutterHotReload<CR>", "Hot Reload" },
                                q = { "<cmd>FlutterQuit<CR>", "Quit App" },
                            },
                        }, { buffer = bufnr })
                    end,
                },
            })
        end,
    },
}
