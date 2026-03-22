return {
  { "Mofiqul/vscode.nvim" }, -- vscode

  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  { "jacoborus/tender.vim", name = "tender", lazy = false, priority = 1000 },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
