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

  use 'tomasiser/vim-code-dark'
  use 'rebelot/kanagawa.nvim'
  use 'folke/tokyonight.nvim'
  use 'projekt0n/github-nvim-theme'
  use 'embark-theme/vim'
  use 'morhetz/gruvbox'
  use 'sainnhe/everforest'
  use 'YorickPeterse/vim-paper'
  use 'leafOfTree/vim-svelte-theme'
  use 'YorickPeterse/Autumn.vim'

  use 'nvim-lua/plenary.nvim'
  use 'mattn/emmet-vim'

  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-sensible'
  use 'tpope/vim-fugitive'

  use { 'akinsho/git-conflict.nvim', config = "require('plugins.git-conflict')" }

  use { 'junegunn/fzf', run = 'fzf#install()' }
  use 'junegunn/fzf.vim'

  use { 'norcalli/nvim-colorizer.lua',
    config = "require('plugins.colorizer')" }
  use 'amadeus/vim-convert-color-to'

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

  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    requires = { 'nvim-lua/plenary.nvim' },
    config = "require('plugins.telescope')",
  }

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
  --   -- 'neovim/nvim-lspconfig',
  --   'williamboman/nvim-lspconfig',
  --   branch = 'feat/eslint-yarn2-pnp',
  --   requires = { 'hrsh7th/cmp-nvim-lsp', opt = true },
  --   config = "require('plugins.lsp')"
  -- }

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

  use { 'neoclide/coc.nvim', branch = 'release' }

  use { 'slim-template/vim-slim' }
end)
