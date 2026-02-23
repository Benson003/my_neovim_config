vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, { border = border })

return {

    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup({
                PATH = "prepend",
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")

            -- 1. Create a formatting group to prevent duplicate autocmds
            local formatting_group = vim.api.nvim_create_augroup("LspFormatting", {})

            mason.setup({ ui = { border = "rounded" } })

            -- FANCY DIAGNOSTICS (Make the editor "Alive")
            local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = "󰋽 " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            vim.diagnostic.config({
                virtual_text = { prefix = "●", spacing = 4 },
                float = { border = "rounded", source = "always" },
                update_in_insert = true,
                severity_sort = true,
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local server_settings = {
                ["lua_ls"] = {
                    settings = { Lua = { diagnostics = { globals = { "vim" } } } }
                },
                ["gopls"] = {
                    settings = {
                        gopls = {
                            semanticTokens = true,
                            analyses = { unusedparams = true },
                            staticcheck = true,
                            hints = {
                                assignVariableTypes = true,
                                compositeLiteralFields = true,
                                compositeLiteralTypes = true,
                                constantValues = true,
                                functionTypeParameters = true,
                                parameterNames = true,
                                rangeVariableTypes = true,
                            },
                        },
                    },
                },
            }

            mason_lspconfig.setup({
                ensure_installed = { "lua_ls", "gopls", "rust_analyzer", "ts_ls", "zls","pyright","ruff" },
                automatic_installation = true,
                handlers = {
                    function(server_name)
                        local opts = {
                            capabilities = capabilities,
                            on_attach = function(client, bufnr)
                                -- 2. SEMANTIC TOKENS (Vibrant Colors)
                                if client.server_capabilities.semanticTokensProvider then
                                    client.server_capabilities.semanticTokensProvider = {
                                        full = true,
                                        legend = client.server_capabilities.semanticTokensProvider.legend,
                                    }
                                end

                                -- 3. UNIFIED AUTO-FORMAT ON SAVE
                                vim.api.nvim_clear_autocmds({ group = formatting_group, buffer = bufnr })
                                vim.api.nvim_create_autocmd("BufWritePre", {
                                    group = formatting_group,
                                    buffer = bufnr,
                                    callback = function()
                                        local ft = vim.bo[bufnr].filetype
                                        if ft == "zig" then
                                            -- Use standard Zig Toolchain directly
                                            vim.fn.system({ "zig", "fmt", vim.api.nvim_buf_get_name(bufnr) })
                                            vim.cmd("edit!")
                                        elseif client.supports_method("textDocument/formatting") then
                                            -- Use LSP for Go, Rust, etc.
                                            vim.lsp.buf.format({ bufnr = bufnr, async = false })
                                        end
                                    end,
                                })
                            end,
                        }

                        if server_settings[server_name] then
                            opts = vim.tbl_deep_extend("force", opts, server_settings[server_name])
                        end

                        require("lspconfig")[server_name].setup(opts)
                    end,
                },
            })
        end,
    },

   	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		opts = {
			ensure_installed = { "stylua", "prettier", "black", "gofumpt","ruff" },
			-- Set this to false to stop the "Package is already installing" race condition
			automatic_installation = false,
		},
	},

	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local null_ls = require("null-ls")
			local b = null_ls.builtins -- Shortcut for readability

			null_ls.setup({
				border = "rounded",
				sources = {
					-- LUA
					b.formatting.stylua,

					-- WEB (The source of your error)
					-- We use the string name if the table indexing fails

					b.formatting.prettier,

					-- PYTHON (The "vibrant" formatter)
					b.formatting.black,

					-- ZIG (Essential for Zig syntax)

					-- GO
					b.formatting.gofumpt,
				},
				-- Auto-format on save
				on_attach = function(client, bufnr)
					if client:supports_method("textDocument/formatting") then
						local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			})
		end,
	},
}
