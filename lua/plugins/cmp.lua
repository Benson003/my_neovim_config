return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
			"windwp/nvim-autopairs",
			"ray-x/lsp_signature.nvim",
			"rafamadriz/friendly-snippets", -- Adds the actual VSCode snippets
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				-- VSCode/Zed style: Rounded borders and consistent padding
				window = {
					completion = cmp.config.window.bordered({
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
					}),
					documentation = cmp.config.window.bordered({
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
					}),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					-- Improved Tab behavior for snippets
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				formatting = {
					fields = { "kind", "abbr", "menu" }, -- Rearrange to look more like VSCode
					format = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
						before = function(entry, vim_item)
							-- Add a bit of space between icon and text
							vim_item.kind = string.format("%s ", vim_item.kind)
							vim_item.menu = ({
								nvim_lsp = "[LSP]",
								luasnip = "[Snip]",
								buffer = "[Buf]",
								path = "[Path]",
							})[entry.source.name]
							return vim_item
						end,
					}),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
