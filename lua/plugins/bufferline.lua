local bufferline = require("bufferline")

bufferline.setup({
	options = {
		mode = "buffers", -- set to "tabs" to only show tabpages instead
		style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
		themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
		numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
		close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
		right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
		indicator = {
			icon = "▎", -- this should be omitted if indicator style is not 'icon'
			style = "icon", -- | 'underline' | 'none',
		},
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		truncate_names = true, -- whether or not tab names should be truncated
		tab_size = 18,
		diagnostics = "nvim_lsp", -- | "coc",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or ""
			return " " .. icon .. count
		end,
		-- offsets = {
		--     {
		--         filetype = "NvimTree",
		--         text = "File Explorer" | function ,
		--         text_align = "left" | "center" | "right"
		--         separator = true
		--     }
		-- },
		color_icons = true, -- | false, -- whether or not to add the filetype icon highlights
		show_buffer_icons = true, -- | false, -- disable filetype icons for buffers
		show_buffer_close_icons = true, -- | false,
		show_close_icon = true, -- | false,
		show_tab_indicators = true, -- | false,
		show_duplicate_prefix = true, -- | false, -- whether to show duplicate buffer prefix
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		separator_style = "slant", -- | "slope" | "thick" | "thin" | { 'any', 'any' },
		enforce_regular_tabs = false, -- | true,
		always_show_bufferline = true, -- | false,
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		sort_by = "directory", -- 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs'
	},
})
