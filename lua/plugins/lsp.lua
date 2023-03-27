vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	signs = true,
	update_in_insert = false,
	underline = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
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
					diagnostic.message,
					-- shows the name of the rule
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
	tsserver = {},
	lua_ls = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			format = { enable = false },
			hint = { enable = true, setType = true },
			telemetery = { enable = false },
		},
	},
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require("mason").setup()

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	-- ensure_installed = vim.tbl_keys(servers),
	ensure_installed = {
		"eslint",
		"marksman",
		"lua_ls",
		"tsserver",
	},
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

-- Setup neovim lua configuration
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

	-- ["tailwindcss"] = function()
	-- 	lspconfig.svelte.setup({
	-- 		capabilities = capabilities,
	-- 		on_attach = on_attach,
	-- 		root_dir = require("lspconfig.util").root_pattern(
	-- 			"tailwind.config.cjs",
	-- 			"tailwind.config.js",
	-- 			"tailwind.config.ts",
	-- 			"postcss.config.cjs",
	-- 			"postcss.config.js",
	-- 			"postcss.config.ts"
	-- 		),
	-- 	})
	-- end,

	-- svelte + typescript
	-- requires manual implementation of typescript-svelte-plugin for every project
	-- npm i --save-dev typescript-svelte-plugin
	-- Then add it to tsconfig.json
	-- {
	--    "compilerOptions": {
	--      ...
	--      "plugins": [{
	--        "name": "typescript-svelte-plugin"
	--      }]
	--    }
	-- }
	["svelte"] = function()
		lspconfig.svelte.setup({
			capabilities = capabilities,
			on_attach = function(client, buffer)
				on_attach(client, buffer)
				client.server_capabilities.completionProvider.triggerCharacters = {
					".",
					'"',
					"'",
					"`",
					"/",
					"@",
					"*",
					"#",
					"$",
					"+",
					"^",
					"(",
					"[",
					"-",
					":",
				}
			end,
			settings = {
				plugin = {
					svelte = {
						format = { config = { svelteStrictMode = true } },
					},
				},
			},
		})
	end,

	["lua_ls"] = function()
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers["lua_ls"],
		})
	end,
})

-- Turn on lsp status information
require("fidget").setup()
