-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- colorscheme
  -- use 'morhetz/gruvbox'
  use 'tomasiser/vim-code-dark'
  use {'bluz71/vim-nightfly-guicolors'}
  use {'folke/tokyonight.nvim'}
  -- use { 'projekt0n/github-nvim-theme',
  --   config = "require('plugins.github-theme')"
  -- }
  -- use 'bdesham/biogoo'
  -- use 'j201/stainless'
  -- use 'jonathanfilip/vim-lucius'
  -- use 'kba/vim-eclipse-color'
  -- use 'NLKNguyen/papercolor-theme'

  use 'nvim-lua/plenary.nvim'
  use 'mattn/emmet-vim'

  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-sensible'

  use { 'junegunn/fzf', run = 'fzf#install()' }
  use 'junegunn/fzf.vim'

  use { 'norcalli/nvim-colorizer.lua', config = "require('plugins.colorizer')" }

  use 'kyazdani42/nvim-web-devicons'
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = "require('plugins.lualine')" }
  use { 'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = "require('plugins.bufferline')" }


  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = "require('plugins.nvimtree')"
  }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim',
    config = "require('plugins.telescope')",
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim' }
    }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'cljoly/telescope-repo.nvim' }


  -- LSP Cmp
  -- use { 'hrsh7th/cmp-nvim-lsp' }

  -- use { 'L3MON4D3/LuaSnip' }
  -- use { 'hrsh7th/cmp-nvim-lua' }
  -- use { 'hrsh7th/cmp-buffer' }
  -- use { 'hrsh7th/cmp-path' }
  -- use { 'saadparwaiz1/cmp_luasnip' }
  -- use { 'hrsh7th/nvim-cmp', config = "require('plugins.cmp')" }

  -- -- LSP Base
  -- use {
  --   'neovim/nvim-lspconfig',
  --   requires = { 'hrsh7th/cmp-nvim-lsp', opt = true },
  --   config = "require('plugins.lsp')"
  -- }

  -- LSP Base
  use {'neovim/nvim-lspconfig'}
  use {'williamboman/nvim-lsp-installer'}

  -- LSP Cmp
  use {'hrsh7th/nvim-cmp', config = "require('plugins.cmp')"}
  use {'hrsh7th/cmp-nvim-lua'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp'}
  use {'hrsh7th/cmp-path', after = 'cmp-buffer'}
  use {'hrsh7th/cmp-cmdline', after = 'cmp-path'}
  use {'hrsh7th/cmp-calc', after = 'cmp-cmdline'}
  use {'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp', after = 'cmp-calc'}
  use {'David-Kunz/cmp-npm', after = 'cmp-tabnine', requires = 'nvim-lua/plenary.nvim', config = "require('plugins.cmp-npm')"}
  use {'saadparwaiz1/cmp_luasnip', after = 'cmp-npm'}

  -- LSP Addons
  -- use {'williamboman/nvim-lsp-installer', event = 'BufEnter', after = 'cmp-nvim-lsp'}
  use {'stevearc/dressing.nvim', requires = 'MunifTanjim/nui.nvim', config = "require('plugins.dressing')"}
  use {'onsails/lspkind-nvim'}
  use {'folke/lsp-trouble.nvim', config = "require('plugins.trouble')"}
  use {'nvim-lua/popup.nvim'}
  use {'SmiteshP/nvim-gps', config = "require('plugins.gps')", after = 'nvim-treesitter'}
  use {'jose-elias-alvarez/nvim-lsp-ts-utils', after = {'nvim-treesitter'}}

  -- use {
  --   'jose-elias-alvarez/null-ls.nvim',
  --   after = "nvim-lspconfig",
  --   requires = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("plugins.null-ls").setup()
  --   end,
  -- }

  use { 'nvim-treesitter/nvim-treesitter',
    config = "require('plugins.treesitter')",
    run = ':TSUpdate' }
end)
