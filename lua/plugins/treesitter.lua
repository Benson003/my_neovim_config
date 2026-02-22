return {
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            max_lines = 3, -- Don't let it take up too much space
            multiline_threshold = 1,
        },
    },
    
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        priority = 1000,
        build = function()
            local languages = {
                "bash", "c", "diff", "html", "javascript", "jsdoc", "json", "jsonc",
                "lua", "luadoc", "luap", "markdown", "markdown_inline", "python",
                "query", "regex", "toml", "tsx", "typescript", "vim", "vimdoc", "yaml",
                "go", "gomod", "gowork", "gosum", "rust", "ron", "svelte", "zig"
            }
            require("nvim-treesitter").install(languages)
        end,
        config = function()
            local ts = require("nvim-treesitter")
            local install_path = vim.fn.stdpath("data") .. "/site"

            -- Crucial: Make sure Neovim looks in the right place
            vim.opt.runtimepath:prepend(install_path)

            ts.setup({
                install_dir = install_path,
            })

            local languages = {
                "bash", "c", "diff", "html", "javascript", "jsdoc", "json", "jsonc",
                "lua", "luadoc", "luap", "markdown", "markdown_inline", "python",
                "query", "regex", "toml", "tsx", "typescript", "vim", "vimdoc", "yaml",
                "go", "gomod", "gowork", "gosum", "rust", "ron", "svelte", "zig"
            }

            -- Only start Treesitter for our whitelist
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    local ft = vim.bo[args.buf].filetype
                    for _, lang in ipairs(languages) do
                        if lang == ft then
                            local parser = vim.treesitter.language.get_lang(ft)
                            if parser then
                                pcall(vim.treesitter.start, args.buf, parser)
                            end
                            break
                        end
                    end
                end,
            })
        end,
    },
}
