-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

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

  use 'nvim-tree/nvim-web-devicons'
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = "require('plugins.lualine')" }
  use { 'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons',
    config = "require('plugins.bufferline')" }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = "require('plugins.nvimtree')",
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    requires = { 'nvim-lua/plenary.nvim' },
    config = "require('plugins.telescope')",
  }
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }


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
  use { 'fannheyward/telescope-coc.nvim' }

  use { 'slim-template/vim-slim' }

  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({})
    end,
  })

  if is_bootstrap then
    require('packer').sync()
  end
end)
