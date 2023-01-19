local present, nvimtree = pcall(require, "nvim-tree")

if not present then
	return
end

nvimtree.setup({
	filters = {
		dotfiles = false,
	},
	disable_netrw = true,
	hijack_netrw = true,
	ignore_ft_on_setup = { "dashboard" },
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
		indent_markers = {
			enable = false,
		},
		add_trailing = false,
		highlight_git = true,
		highlight_opened_files = "all",
		root_folder_modifier = table.concat({ ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }),
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				git = {
					deleted = "",
					ignored = "",
					renamed = "",
					staged = "",
					unmerged = "",
					unstaged = "",
					untracked = "",
				},
				folder = {
					arrow_closed = "▸",
					arrow_open = "▾",
					default = "",
					empty = "",
					empty_open = "",
					open = "",
					symlink = "",
					symlink_open = "",
				},
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
