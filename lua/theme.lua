local function kanagawa()
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

local function github()
  require('github-theme').setup({
    theme_style = "light",
  })
end

local function tokyonight()
  vim.o.background = 'light'
  vim.g.tokyonight_style = "day"
  vim.g.tokyonight_italic_functions = true
  vim.g.tokyonight_day_brightness = 0.1

  vim.cmd("colorscheme tokyonight")
end

-- Black line numbers and signcolumn
-- vim.cmd('hi! LineNr guibg=0')
-- vim.cmd('hi! GitGutterAdd guibg=0')
-- vim.cmd('hi! GitGutterChange guibg=0')
-- vim.cmd('hi! GitGutterDelete guibg=0')
-- vim.cmd('hi! SignColumn guibg=0')

-- -- Make ColorColumn the same color as cursorline
-- vim.cmd('hi! link ColorColumn CursorLine')

-- kanagawa()
tokyonight()
-- github()
