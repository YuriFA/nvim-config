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

M.gruvbox_light = function()
  vim.o.background = 'light'
  vim.g.gruvbox_contrast_light = "hard"
  vim.cmd("colorscheme gruvbox")
end

M.everforest = function()
  vim.o.background = 'dark'
  vim.cmd("colorscheme everforest")
end

M.codedark = function()
  vim.o.background = 'dark'
  vim.cmd("colorscheme codedark")
end

M.paper = function()
  vim.cmd("colorscheme paper")
end

M.grey = function()
  vim.o.background = 'light'
  vim.cmd("color grey")
end

M.autumn = function()
  vim.o.background = 'dark'
  vim.cmd("colorscheme autumn")
end

M.jellybeans_nvim = function()
  vim.o.background = 'dark'
  vim.cmd("colorscheme jellybeans-nvim")
end

M.codedark()
-- M.autumn()
-- M.grey()

-- vim.api.nvim_set_hl(0, 'DiffText', { fg = "#ffffff", bg = "#1d3b40" })
-- vim.api.nvim_set_hl(0, 'DiffAdd', { fg = "#ffffff", bg = "#1d3450" })
