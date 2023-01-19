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
			"svelte",
			"json",
			"jsonc",
			"yaml",
			"markdown",
			"markdown.mdx",
			"graphql",
		},
		-- prefer_local = "node_modules/.bin",
		-- dynamic_command = function(params)
		--   return command_resolver.from_yarn_pnp(params)
		--       or command_resolver.from_node_modules(params)
		--       or vim.fn.executable(params.command) == 1 and params.command
		-- end,
	}),
}

local M = {}
M.setup = function()
	null_ls.setup({
		sources = sources,
		diagnostics_format = "[#{c}] #{m} (#{s})",
	})
end

return M
