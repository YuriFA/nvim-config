local present, nvimtree = pcall(require, "nvim-tree")

if not present then
  return
end

nvimtree.setup {
  filters = {
    dotfiles = false,
  },
  disable_netrw = true,
  hijack_netrw = true,
  ignore_ft_on_setup = { "dashboard" },
  auto_close = false,
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  git = {
    ignore = false,
  },
  renderer = {
    indent_markers = {
      enable = false,
    },
  },
  actions = {
    open_file = {
      quit_on_open = 0,
      window_picker = {
        exclude = {
          filetype = { "notify", "packer", "qf" },
          buftype = { "terminal" },
        },
      },
    },
  },
}
