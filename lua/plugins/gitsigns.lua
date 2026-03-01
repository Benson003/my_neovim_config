return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			-- FANCY STUFF START
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol",
				delay = 500,
			},
			preview_config = {
				border = "rounded",
			},
			-- FANCY STUFF END
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]h", function()
					if vim.wo.diff then
						return "]h"
					end
					vim.schedule(function()
						gitsigns.nav_hunk("next")
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Next Hunk" })

				map("n", "[h", function()
					if vim.wo.diff then
						return "[h"
					end
					vim.schedule(function()
						gitsigns.nav_hunk("prev")
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Prev Hunk" })

				-- Actions
				map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
				map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
				map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
				map("n", "<leader>hb", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "Blame Line" })
				map("n", "<leader>hd", gitsigns.diffthis, { desc = "Diff This" })
			end,
		},
	},
}
