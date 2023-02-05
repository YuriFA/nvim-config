return function(use)
	use({
		"nvim-tree/nvim-tree.lua",
		requires = "nvim-tree/nvim-web-devicons", -- optional, for file icons
		config = "require('custom.plugins.nvimtree')",
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	use({
		"akinsho/bufferline.nvim",
		tag = "v3.*",
		requires = "nvim-tree/nvim-web-devicons",
		config = "require('custom.plugins.bufferline')",
	})

	-- use {'nvim-telescope/telescope-ui-select.nvim' }

	-- LSP Cmp Autocompletion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = "require('custom.plugins.cmp')",
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		after = "nvim-lspconfig",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("custom.plugins.null-ls").setup()
		end,
	})

	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = "require('custom.plugins.lspsaga')",
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = "require('custom.plugins.colorizer')",
	})

	use({
		"akinsho/git-conflict.nvim",
		config = "require('custom.plugins.git-conflict')",
	})

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})

	use({ "junegunn/fzf", run = ":call fzf#install()" })
	use({ "junegunn/fzf.vim" })

	use({
		"mattn/emmet-vim",
		config = function()
			vim.g.user_emmet_mode = "a"
			vim.g.user_emmet_leader_key = ","
		end,
	})
end
