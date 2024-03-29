return { -- LSP Base
	-- { "jose-elias-alvarez/typescript.nvim" },
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		ft = {
			"typescript",
			"typescriptreact",
			"typescript.tsx",
			"javascript",
			"javascriptreact",
			"javascript.jsx",
		},
		opts = {},
		-- config = function()
		-- 	require("typescript-tools").setup({
		-- 		settings = {
		-- 			separate_diagnostic_server = false,
		-- 		},
		-- 	})
		-- end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim", -- Useful status updates for LSP
			"j-hui/fidget.nvim", -- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
		config = function()
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					virtual_text = false,
					signs = true,
					update_in_insert = false,
					underline = true,
				})

			local signs = {
				Error = " ",
				Warn = " ",
				Hint = " ",
				Info = " ",
			}

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, {
					text = icon,
					texthl = hl,
					numhl = hl,
				})
			end

			vim.diagnostic.config({
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				virtual_text = true,
				float = {
					border = "rounded",
					format = function(diagnostic)
						if diagnostic.source == "eslint" then
							return string.format(
								"%s [%s]",
								diagnostic.message, -- shows the name of the rule
								diagnostic.user_data.lsp.code
							)
						end
						return string.format("%s [%s]", diagnostic.message, diagnostic.source)
					end,
					severity_sort = true,
					close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
					max_width = 100,
				},
			})

			local servers = {
				eslint = {},
				-- tsserver = {},
				lua_ls = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						format = {
							enable = false,
						},
						hint = {
							enable = true,
							setType = true,
						},
						telemetery = {
							enable = false,
						},
					},
				},
			}

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			require("mason").setup()

			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup({
				ensure_installed = { "eslint", "marksman", "lua_ls" }, -- , "tsserver" },
				automatic_installation = true,
			})

			local on_attach = function(client, buf)
				local ft = vim.api.nvim_buf_get_option(buf, "filetype")
				local sources = require("null-ls.sources")
				local available = sources.get_available(ft, "NULL_LS_FORMATTING")
				local has_formatter = #available > 0

				local enable = false
				if has_formatter then
					enable = client.name == "null-ls"
				else
					enable = not (client.name == "null-ls")
				end

				if client.name == "tsserver" then
					enable = false
				end

				client.server_capabilities.documentFormattingProvider = enable
			end

			require("neodev").setup()

			local lspconfig = require("lspconfig")

			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
						settings = servers[server_name],
					})
				end,

				-- ["tsserver"] = function()
				-- 	require("typescript").setup({
				-- 		disable_commands = false, -- prevent the plugin from creating Vim commands
				-- 		debug = false, -- enable debug logging for commands
				-- 		go_to_source_definition = {
				-- 			fallback = true, -- fall back to standard LSP definition on failure
				-- 		},
				-- 		server = {
				-- 			capabilities = capabilities,
				-- 			on_attach = on_attach,
				-- 			settings = servers["tsserver"],
				-- 		},
				-- 	})
				-- end,

				["solargraph"] = function()
					-- local enabled_features = {
					-- 	"documentHighlights",
					-- 	"documentSymbols",
					-- 	"foldingRanges",
					-- 	"selectionRanges",
					-- 	-- "semanticHighlighting",
					-- 	"formatting",
					-- 	"codeActions",
					-- }

					lspconfig.solargraph.setup({
						init_options = {
							-- enabledFeatures = enabled_features,
						},
						settings = {},
					})
				end,
			})

			-- Turn on lsp status information
			require("fidget").setup()
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")

			local sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier.with({
					filetypes = {
						"html",
						"json",
						"markdown",
						"scss",
						"css",
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"yaml",
						"markdown",
						"markdown.mdx",
					},
				}),
				-- require("typescript.extensions.null-ls.code-actions"),
			}

			null_ls.setup({
				debug = true,
				sources = sources,
				diagnostics_format = "[#{c}] #{m} (#{s})",
			})
		end,
	},
}
