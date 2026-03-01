return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local colors = require("catppuccin.palettes").get_palette()

			local catppuccin_lualine = {
				normal = {
					a = { fg = colors.base, bg = colors.blue, gui = "bold" },
					b = { fg = colors.surface2, bg = colors.mantle },
					c = { fg = colors.text, bg = colors.mantle },
				},
				insert = {
					a = { fg = colors.base, bg = colors.green, gui = "bold" },
					b = { fg = colors.surface2, bg = colors.mantle },
					c = { fg = colors.text, bg = colors.mantle },
				},
				visual = {
					a = { fg = colors.base, bg = colors.peach, gui = "bold" },
					b = { fg = colors.surface2, bg = colors.mantle },
					c = { fg = colors.text, bg = colors.mantle },
				},
				replace = {
					a = { fg = colors.base, bg = colors.red, gui = "bold" },
					b = { fg = colors.surface2, bg = colors.mantle },
					c = { fg = colors.text, bg = colors.mantle },
				},
				command = {
					a = { fg = colors.base, bg = colors.sky, gui = "bold" },
					b = { fg = colors.surface2, bg = colors.mantle },
					c = { fg = colors.text, bg = colors.mantle },
				},
				inactive = {
					a = { fg = colors.text, bg = colors.surface0 },
					b = { fg = colors.text, bg = colors.surface0 },
					c = { fg = colors.text, bg = colors.surface0 },
				},
			}

			require("lualine").setup({
				options = {
					theme = catppuccin_lualine,
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
					globalstatus = true, -- spans bottom
					icons_enabled = true,
				},
				sections = {
					lualine_a = { { "mode", separator = { left = "", right = "" } } },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { { "location", separator = { left = "", right = "" } } },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
			})

			-- Make sure cmdline has a reserved line
			vim.o.cmdheight = 1
		end,
	},
}
