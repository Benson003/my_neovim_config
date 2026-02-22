-- lsp.lua
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lsp = vim.lsp

            -- Lua
            lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                    },
                },
            })

            -- Go
            lsp.config("gopls", {})

            -- TypeScript
            lsp.config("ts_ls", {})

            -- Python
            lsp.config("pyright", {})

            -- Rust
            lsp.config("rust_analyzer", {})

            -- Zig
            lsp.config("zls", {})
        end,
    },
}
