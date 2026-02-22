return {
    {
        "echasnovski/mini.indentscope",
        version = false,
        config = function()
            local indent = require("mini.indentscope")

            -- Depth colors
            local colors = { "#f38ba8", "#8bd5ca", "#f9e2af", "#9ccfd8" }
            for i, color in ipairs(colors) do
                vim.api.nvim_set_hl(0, "MiniIndentscopeDepth" .. i, { fg = color, bold = true, nocombine = true })
            end

            indent.setup({
                symbol = "▏",
                options = { try_as_border = true, indent_at_cursor = true },
                draw = {
                    delay = 0,
                    animation = function(bufnr)
                        if not vim.api.nvim_buf_is_valid(bufnr) then return 0 end
                        if vim.bo[bufnr].filetype == "alpha" then return 0 end
                        return 30
                    end,
                },
                scope = {
                    show_start = true,
                    highlight = function(_, _, _, depth)
                        local idx = (depth - 1) % #colors + 1
                        return "MiniIndentscopeDepth" .. idx
                    end,
                },
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "alpha",
                callback = function() vim.b.miniindentscope_disable = true end,
            })
        end,
    },
}
