return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"javascript",
					"typescript",
					"tsx",
					"json",
					"jsonc",
					"vim",
					"css",
					"scss",
					"dot",
					"markdown",
					"html",
				},
				sync_install = false,
				auto_install = true,
				ignore_install = {},

        enable = false,

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},

				modules = {},

				indent = {
					enable = true,
				},

				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
			})
		end,
		build = ":TSUpdate",
	},
}
