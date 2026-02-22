return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            -- 1. Performance Tuning
            vim.opt.updatetime = 16
            vim.opt.redrawtime = 100

            local ok, configs = pcall(require, "nvim-treesitter.configs")
            if ok then
                configs.setup({
                    ensure_installed = { "go", "lua", "rust", "python", "javascript", "typescript", "tsx" },
                    highlight = {
                        enable = true,
                        -- IMPORTANT: Set this to false so Treesitter doesn't fight with Vim regex
                        additional_vim_regex_highlighting = false,
                    },
                })
            end

            -- 2. THE FIX: Force Link capture groups to Catppuccin's palette
            -- If these aren't linked, your user-defined code stays white.
            local hl_groups = {
                ["@module"]             = "Include",
                ["@function.call"]      = "Function",
                ["@method.call"]        = "Function",
                ["@variable.member"]    = "Identifier",
                ["@property"]           = "Identifier",
                ["@type"]               = "Type",
                ["@variable.parameter"] = "Identifier",
                ["@constructor"]        = "Special",
            }
            for group, link in pairs(hl_groups) do
                vim.api.nvim_set_hl(0, group, { link = link, default = false }) -- default = false forces it
            end

            -- 3. THE LIVE ENGINE: Safe attachment + Redraw
            vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
                group = vim.api.nvim_create_augroup("TSLiveEngine", { clear = true }),
                callback = function(args)
                    local ft = vim.bo[args.buf].filetype
                    if ft == "" or ft == "noice" or ft == "notify" then return end

                    -- Check if parser is actually installed
                    local lang = vim.treesitter.language.get_lang(ft) or ft
                    local has_parser = pcall(vim.treesitter.get_parser, args.buf, lang)

                    if has_parser then
                        vim.treesitter.start(args.buf, lang)
                    end
                end,
            })
        end,
    },
}
