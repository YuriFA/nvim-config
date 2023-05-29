return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--fixed-strings",
						"-u",
					},
					prompt_prefix = "   ",
					selection_caret = "  ",
					entry_prefix = "  ",
					initial_mode = "insert",
					selection_strategy = "reset",
					sorting_strategy = "ascending",
					-- layout_strategy = "horizontal",
					-- layout_config = {
					-- 	horizontal = {
					-- 		prompt_position = "top",
					-- 		preview_width = 0.55,
					-- 		results_width = 0.8,
					-- 	},
					-- 	vertical = {
					-- 		mirror = false,
					-- 	},
					-- 	width = 0.87,
					-- 	height = 0.80,
					-- 	preview_cutoff = 120,
					-- },
					file_sorter = require("telescope.sorters").get_fuzzy_file,
					file_ignore_patterns = {
						"node_modules/",
						".yarn/",
						".git/",
						".github/",
						"build/",
						"log/",
						"yarn.lock",
					},
					-- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
					path_display = { "truncate" },
					-- winblend = 0,
					-- border = {},
					-- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					color_devicons = true,
					set_env = {
						["COLORTERM"] = "truecolor",
					}, -- default = nil,
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
					-- Developer configurations: Not meant for general override
					buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
				},
				pickers = {
					find_files = {
						theme = "dropdown",
						previewer = false,
						layout_config = {
							preview_cutoff = 1, -- Preview should always show (unless previewer = false)

							width = function(_, max_columns, _)
								return math.min(max_columns, 80)
							end,

							height = function(_, _, max_lines)
								return math.min(max_lines, 30)
							end,
						},
					},
					live_grep = {
						layout_strategy = "vertical",
						layout_config = {
              horizontal = { width = 0.9, height = 0.9 },
							vertical = { width = 0.9, height = 0.9 },
						},
					},
				},
			})

			local extensions = {
				"themes",
				"terms",
				"fzf",
				"dir",
			}

			pcall(function()
				for _, ext in ipairs(extensions) do
					telescope.load_extension(ext)
				end
			end)
		end,
	}, -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = vim.fn.executable("make") == 1,
	},
	{
		"princejoogie/dir-telescope.nvim",
		-- telescope.nvim is a required dependency
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("dir-telescope").setup({
				-- these are the default options set
				hidden = true,
				no_ignore = false,
				show_preview = true,
			})
		end,
	},
}
