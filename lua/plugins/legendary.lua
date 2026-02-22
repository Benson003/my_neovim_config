return {
    {
        "mrjones2014/legendary.nvim",
        version = "2.13.*", -- stable series
        keys = {
            { "<leader>?", "<cmd>Legendary<CR>", desc = "Legendary: Keymap & Command Palette" },
        },
        config = function()
            require("legendary").setup({
                keymaps = {}, -- let legendary discover your keymaps
                commands = {},
                autocmds = {},
                select_prompt = "Legendary: ",
            })
        end,
    },
}
