local plugins = {
	{ "tomasiser/vim-code-dark" },
  { "navarasu/onedark.nvim" },
  { 'projekt0n/github-nvim-theme' },

	{ "nvim-lua/plenary.nvim" },
	{ "mattn/emmet-vim" },

	{ "tpope/vim-surround" },
	{ "tpope/vim-commentary" },
	{ "tpope/vim-sensible" },
	{ "tpope/vim-fugitive" },

	{ "junegunn/fzf", build = "fzf#install()" },
	{ "junegunn/fzf.vim" },

	{ "amadeus/vim-convert-color-to" },

	{ "nvim-tree/nvim-web-devicons" },

	-- use { 'neoclide/coc.nvim', branch = 'release' }
	-- use { 'fannheyward/telescope-coc.nvim' }

	{ "j-hui/fidget.nvim", tag = "legacy" }, -- Additional lua configuration, makes nvim stuff amazing

	{ "slim-template/vim-slim" },

	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	},
}

return plugins
