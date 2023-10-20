M = {}

M.codedark = function()
	vim.o.background = "dark"
	vim.cmd("colorscheme codedark")
end

M.catpucchin = function()
	vim.o.background = "dark"
	vim.cmd("colorscheme catppuccin-macchiato")
end

function M.setup()
	M.codedark()

	vim.api.nvim_set_hl(0, "DiffText", {
		fg = "#ffffff",
		bg = "#1d3b40",
	})
	vim.api.nvim_set_hl(0, "DiffAdd", {
		fg = "#ffffff",
		bg = "#1d3450",
	})
end

return M
