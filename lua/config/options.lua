-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false

-- Old Emmet
-- vim.g.emmet_debug = 0
-- vim.g.user_emmet_mode = "a"
-- vim.g.user_emmet_leader_key = ","

local opt = vim.opt

opt.wrap = true -- Disable line wrap

-- FOR git-conflict
vim.api.nvim_set_hl(0, "DiffText", {
  fg = "#ffffff",
  bg = "#1d3b40",
})
vim.api.nvim_set_hl(0, "DiffAdd", {
  fg = "#ffffff",
  bg = "#1d3450",
})
