local treesitter = require("nvim-treesitter.configs")

treesitter.setup {
  ensure_installed = {}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false,            -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "haskell" },  -- list of parsers to ignore installing
  highlight = {
    enable = true,
    -- disable = { "c", "rust" },  -- list of language that will be disabled
    -- additional_vim_regex_highlighting = false,
  },

  incremental_selection = {
    enable = false,
    keymaps = {
      init_selection    = "<leader>gnn",
      node_incremental  = "<leader>gnr",
      scope_incremental = "<leader>gne",
      node_decremental  = "<leader>gnt",
    },
  },

  indent = {
    enable = true
  },

  -- rainbow = {
  --   enable = true
  -- },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
