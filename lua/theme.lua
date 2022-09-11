M = {}

M.kanagawa = function()
  vim.o.background = 'dark'

  require("kanagawa").setup({
    dimInactive = false,
    globalStatus = true,
    overrides = {
      TroubleText = { fg = 'fg', bg = 'none' },
    },
    theme = 'default',
    -- theme = 'light'
  })
  vim.o.background = 'dark'

  vim.cmd("colorscheme kanagawa")
end

M.github = function()
  require('github-theme').setup({
    theme_style = 'light',
    function_style = 'italic',
    dark_sidebar = true,
    dark_float = true,
  })
end

M.bergen = function()
  vim.o.background = 'light'

  vim.cmd("colorscheme bergen")
end

M.tokyonight = function()
  vim.o.background = 'light'
  vim.g.tokyonight_style = "day"
  vim.g.tokyonight_italic_functions = true
  vim.g.tokyonight_day_brightness = 0.1

  vim.cmd("colorscheme tokyonight")
end

M.embark = function()
  vim.o.background = 'light'
  vim.cmd("colorscheme embark")
end

M.gruvbox = function()
  vim.o.background = 'dark'
  vim.cmd("colorscheme gruvbox")
end

M.everforest = function()
  vim.o.background = 'dark'
  vim.cmd("colorscheme everforest")
end

M.nord = function()
  vim.o.background = 'dark'
  vim.cmd("colorscheme nord")
end

M.paper = function()
  vim.cmd("colorscheme paper")
end

M.inkstained = function()
  vim.o.background = 'dark'
  vim.cmd("colorscheme inkstained")
end

M.paper()
-- M.everforest()

vim.api.nvim_set_hl(0, 'DiffText', { fg = "#ffffff", bg = "#1d3b40" })
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = "#ffffff", bg = "#1d3450" })
