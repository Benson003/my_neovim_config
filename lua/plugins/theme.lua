return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				transparent_background = false,
				term_colors = true,

				integrations = {
					treesitter = true,
					nvimtree = true,
					lualine = true,
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
