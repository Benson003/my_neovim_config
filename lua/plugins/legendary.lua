return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("which-key").setup({})
		end,
	},
	{
		"mrjones2014/legendary.nvim",
		version = "2.13.*", -- stable series
		keys = {
			{ "<leader>?", "<cmd>Legendary<CR>", desc = "Legendary: Keymap & Command Palette" },
		},
		config = function()
			require("legendary").setup({
				keymaps = {},
				commands = {},
				autocmds = {},
				select_prompt = "Legendary: ",
				include_builtin = true,
				include_legendary_cmds = true,
			})
		end,
	},
}
