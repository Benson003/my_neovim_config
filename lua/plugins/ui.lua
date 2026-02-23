return {

	{ "tpope/vim-sleuth" },
	{
		"Bekaboo/dropbar.nvim",
		dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({
				mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
				easing_function = "quadratic",
			})
		end,
	},

	{
		"sphamba/smear-cursor.nvim",
		opts = {
			cursor_color = "#7aa2f7",
			stiffness = 0.8,
			trailing_stiffness = 0.5,
			trailing_exponent = 2.0,
			excluded_filetypes = { "NvimTree", "TelescopePrompt", "noice" },
		},
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		event = "VeryLazy",
	},

	{
		"RRethy/vim-illuminate",
		event = "VeryLazy",
		config = function()
			require("illuminate").configure({
				delay = 200,
				under_cursor = true,
			})
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			user_default_options = {
				tailwind = true, -- If you use tailwind
				mode = "background",
				names = false,
				RGB = true,
				RRGGBB = true,
				AARRGGBB = true,
			},
		},
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = "VeryLazy",
	},
	{ "echasnovski/mini.icons", config = true },
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
						if not vim.api.nvim_buf_is_valid(bufnr) then
							return 0
						end
						if vim.bo[bufnr].filetype == "alpha" then
							return 0
						end
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
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
}
