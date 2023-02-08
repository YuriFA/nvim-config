vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = {
		source = "always", -- Or "if_many"
	},
})

vim.diagnostic.config({
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	virtual_text = false,
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
		max_width = 80,
	},
})

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
	-- clangd = {},
	-- gopls = {},
	-- pyright = {},
	-- rust_analyzer = {},
	eslint = {},
	tsserver = {},

	sumneko_lua = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },

			-- runtime = {
			--   -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
			--   version = 'LuaJIT',
			--   -- Setup your lua path
			--   path = runtime_path,
			-- },
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
		},
	},
}

-- Setup neovim lua configuration
require("neodev").setup()
--
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
		"sumneko_lua",
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

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		})
	end,
})

-- Turn on lsp status information
require("fidget").setup()
