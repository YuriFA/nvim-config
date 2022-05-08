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
  view = {
    side = 'right',
    width = 60,
    height = 30,
    preserve_window_proportions = true
  },
  actions = {
    open_file = {
      quit_on_open = false,
      window_picker = {
        exclude = {
          filetype = { "notify", "packer", "qf" },
          buftype = { "terminal" },
        },
      },
    },
  },
}
