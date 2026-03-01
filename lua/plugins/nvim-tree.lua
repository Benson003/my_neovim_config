return {
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- Disable netrw
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			-- Modern way to handle mappings
			local function my_on_attach(bufnr)
				local api = require("nvim-tree.api")
				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- Default mappings
				api.config.mappings.default_on_attach(bufnr)

				-- Your custom mappings
				vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
				vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
			end

			require("nvim-tree").setup({
				on_attach = my_on_attach, -- Use the function we just made
				hijack_netrw = true,
				sync_root_with_cwd = true,
				view = {
					width = 35,
					side = "left",
					relativenumber = true,
				},
				renderer = {
					group_empty = true,
					highlight_opened_files = "all",
					indent_markers = { enable = true },
					icons = {
						glyphs = {
							git = {
								unstaged = "✗",
								staged = "✓",
								unmerged = "",
								renamed = "➜",
								untracked = "★",
								deleted = "",
								ignored = "◌",
							},
						},
					},
				},
				actions = {
					open_file = {
						quit_on_open = false, -- Stays open when you select a file
					},
				},
			})

			-- The "Startup on Folder" fix
			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function(data)
					-- Is the argument a directory?
					local is_dir = vim.fn.isdirectory(data.file) == 1

					if is_dir then
						-- Create a new empty buffer
						vim.cmd.enew()
						-- Wipe the directory buffer
						vim.cmd.bw(data.buf)
						-- Move to that directory
						vim.api.nvim_set_current_dir(data.file)
						-- Open the tree
						require("nvim-tree.api").tree.open()
					end
				end,
			})
		end,
	},
}
