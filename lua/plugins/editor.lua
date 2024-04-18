return {
  {
    enabled = false,
    "folke/flash.nvim",
  },

  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf", build = ":call fzf#install()" },
  },
}
