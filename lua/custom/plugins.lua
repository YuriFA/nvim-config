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
		config = function()
			require("custom.plugins.lspsaga")
		end,
	})
end

-- return require('packer').startup(function(use)
--   -- Packer can manage itself
--   use 'wbthomason/packer.nvim'

--   use 'tomasiser/vim-code-dark'
--   use 'rebelot/kanagawa.nvim'
--   use 'folke/tokyonight.nvim'
--   use 'projekt0n/github-nvim-theme'
--   use 'embark-theme/vim'
--   use 'morhetz/gruvbox'
--   use 'sainnhe/everforest'
--   use 'YorickPeterse/vim-paper'
--   use 'YorickPeterse/Autumn.vim'
--   use 'https://gitlab.com/yorickpeterse/nvim-grey'
--   use {
--     'metalelf0/jellybeans-nvim',
--     requires = "rktjmp/lush.nvim"
--   }

--   use 'nvim-lua/plenary.nvim'
--   use 'mattn/emmet-vim'

--   use 'tpope/vim-surround'
--   use 'tpope/vim-commentary'
--   use 'tpope/vim-sensible'
--   use 'tpope/vim-fugitive'

--   use { 'akinsho/git-conflict.nvim', config = "require('plugins.git-conflict')" }

--   use { 'junegunn/fzf', run = 'fzf#install()' }
--   use 'junegunn/fzf.vim'

--   use { 'norcalli/nvim-colorizer.lua',
--     config = "require('plugins.colorizer')" }
--   use 'amadeus/vim-convert-color-to'

--   use 'nvim-tree/nvim-web-devicons'
--   use { 'nvim-lualine/lualine.nvim',
--     requires = { 'nvim-tree/nvim-web-devicons', opt = true },
--     config = "require('plugins.lualine')" }
--   use { 'akinsho/bufferline.nvim',
--     tag = "*",
--     requires = 'nvim-tree/nvim-web-devicons',
--     config = "require('plugins.bufferline')" }

--   use {
--     'nvim-tree/nvim-tree.lua',
--     requires = {
--       'nvim-tree/nvim-web-devicons', -- optional, for file icons
--     },
--     config = "require('plugins.nvimtree')",
--     tag = 'nightly' -- optional, updated every week. (see issue #1193)
--   }

--   use {
--     "nvim-telescope/telescope.nvim",
--     cmd = "Telescope",
--     requires = { 'nvim-lua/plenary.nvim' },
--     config = "require('plugins.telescope')",
--   }
--   use 'fannheyward/telescope-coc.nvim'

--   -- LSP Cmp
--   -- use { 'hrsh7th/cmp-nvim-lsp' }

--   -- use { 'L3MON4D3/LuaSnip' }
--   -- use { 'hrsh7th/cmp-nvim-lua' }
--   -- use { 'hrsh7th/cmp-buffer' }
--   -- use { 'hrsh7th/cmp-path' }
--   -- use { 'saadparwaiz1/cmp_luasnip' }
--   -- use { 'hrsh7th/nvim-cmp', config = "require('plugins.cmp')" }

--   -- -- LSP Base
--   -- use {
--   --   -- 'neovim/nvim-lspconfig',
--   --   'williamboman/nvim-lspconfig',
--   --   branch = 'feat/eslint-yarn2-pnp',
--   --   requires = { 'hrsh7th/cmp-nvim-lsp', opt = true },
--   --   config = "require('plugins.lsp')"
--   -- }

--   use { 'nvim-treesitter/nvim-treesitter',
--     config = "require('plugins.treesitter')",
--     run = ':TSUpdate' }

--   use { 'neoclide/coc.nvim', branch = 'release' }

--   use { 'slim-template/vim-slim' }
-- end)
