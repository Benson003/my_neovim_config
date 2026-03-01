return {
	{
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup({
				input = {
					enabled = true,
					border = "rounded",
					relative = "editor",
					win_options = {
						winblend = 10,
					},
				},
				select = {
					enabled = true,
					backend = { "telescope", "fzf_lua", "builtin" },
					trim_prompt = true,
					telescope = require("telescope.themes").get_dropdown({}),
					builtin = {
						border = "rounded",
						winblend = 10,
						width = 50,
						max_width = { 80, 0.9 },
						min_width = 40,
						height = 0.4,
						max_height = 0.9,
						min_height = 10,
					},
				},
			})
		end,
	},
}
