return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		-- (keys stay the same)
		config = function()
			require("toggleterm").setup({
				size = 20,
				hide_numbers = true,
				shade_terminals = false, -- Turn this off if you want full color clarity
				direction = "float",
				close_on_exit = true,

				-- 1. MAKE IT SOLID
				float_opts = {
					border = "rounded",
					winblend = 0, -- 0 = Fully Opaque
				},

				-- 2. DEFINE COLORS (Matches TokyoNight Float)
				highlights = {
					NormalFloat = {
						link = "NormalFloat",
					},
					FloatBorder = {
						link = "FloatBorder",
					},
				},
			})

			-- (Terminal keymaps logic stays the same)
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			end

			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		end,
	},
}
