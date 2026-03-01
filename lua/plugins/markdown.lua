return {
	{
		"MeanderingProgrammer/markdown.nvim",
		ft = { "markdown" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("render-markdown").setup({
				enabled = false, -- start disabled
			})
		end,
		keys = {
			{
				"<leader>mp",
				function()
					require("render-markdown").toggle()
				end,
				desc = "Toggle inline Markdown render",
			},
		},
	},
}
