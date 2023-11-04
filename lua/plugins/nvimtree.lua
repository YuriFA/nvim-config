return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "nightly", -- optional, updated every week. (see issue #1193)
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		config = function()
			local nvimtree = require("nvim-tree")

			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			nvimtree.setup({
				filters = {
					dotfiles = false,
				},
				disable_netrw = true,
				hijack_netrw = true,
				open_on_tab = false,
				hijack_cursor = true,
				update_cwd = true,
				update_focused_file = {
					enable = true,
					update_cwd = false,
				},
				git = {
					ignore = false,
				},
				renderer = {
					-- indent_markers = {
					-- 	enable = false,
					-- },
					highlight_git = true,
					highlight_opened_files = "all",
					-- root_folder_label= table.concat({ ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }),
					icons = {
						show = {
							file = true,
							folder = true,
							folder_arrow = true,
							git = true,
						},
					},
				},
				view = {
					adaptive_size = true,
					side = "right",
					preserve_window_proportions = true,
				},
				actions = {
					open_file = {
						quit_on_open = false,
						window_picker = {
							exclude = {
								filetype = { "notify", "packer", "qf" },
								buftype = { "terminal" },
							},
						},
					},
				},
			})
		end,
	},
}
