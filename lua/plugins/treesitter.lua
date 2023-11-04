return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"javascript",
					"typescript",
					"json",
					"jsonc",
					"vim",
					"css",
					"scss",
					"dot",
					"markdown",
					"html",
				}, --  "all", "maintained" or a list
				ignore_install = {}, -- List of parsers to ignore installing
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "grn",
						node_decremental = "grN",
						scope_incremental = "grc",
					},
				},
				textobjects = {
					select = {
						enable = true,

						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,

						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["al"] = "@loop.outer",
							["il"] = "@loop.inner",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>ss"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>sS"] = "@parameter.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = "@class.outer",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},
					lsp_interop = {
						enable = true,
						border = "single",
						peek_definition_code = {
							["<leader>lg"] = "@block.outer",
							-- ["<leader>lG"] = "@class.outer",
						},
					},
				},
				textsubjects = {
					enable = true,
					keymaps = {
						["<cr>"] = "textsubjects-smart", -- works in visual mode
					},
				},
				playground = {
					enable = true,
				},
			})
		end,
		build = ":TSUpdate",
	},
}
