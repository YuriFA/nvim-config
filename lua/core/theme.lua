M = {}

M.codedark = function()
	vim.o.background = "dark"
	vim.cmd("colorscheme codedark")
end

M.github = function()
	vim.o.background = "dark"
	vim.cmd("colorscheme github_dark")
end

M.onedark = function()
	vim.o.background = "dark"

	require("onedark").setup({
		style = "warm",
	})
	require("onedark").load()
end

function M.setup()
	M.codedark()

	local links = {
		["@lsp.type.namespace"] = "@namespace",
		["@lsp.type.type"] = "@type",
		["@lsp.type.class"] = "@type",
		["@lsp.type.enum"] = "@type",
		["@lsp.type.interface"] = "@type",
		["@lsp.type.struct"] = "@structure",
		["@lsp.type.parameter"] = "@parameter",
		["@lsp.type.variable"] = "@variable",
		["@lsp.type.property"] = "@property",
		["@lsp.type.enumMember"] = "@constant",
		["@lsp.type.function"] = "@function",
		["@lsp.type.method"] = "@method",
		["@lsp.type.macro"] = "@macro",
		["@lsp.type.decorator"] = "@function",
	}

	for newgroup, oldgroup in pairs(links) do
		vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
	end

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
