return {
	{
		"folke/noice.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		config = function()
			local noice = require("noice")
			noice.setup({
				cmdline = { enabled = false }, -- keep native commandline
				messages = { enabled = false }, -- disable central messages
				popupmenu = { enabled = false }, -- don't hijack completions
				lsp = { override = {} },
				routes = {},
				presets = {},
			})
			vim.notify = require("notify")
		end,
	},
}
