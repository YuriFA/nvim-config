-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false
vim.g.lazyvim_eslint_auto_format = true

-- Old Emmet
-- vim.g.emmet_debug = 0
-- vim.g.user_emmet_mode = "a"
-- vim.g.user_emmet_leader_key = ","

local opt = vim.opt

opt.wrap = true -- Disable line wrap

vim.g.lazyvim_prettier_needs_config = true
