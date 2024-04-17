-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- formatting
keymap.set({ "n", "v" }, "<leader>F", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- save file
keymap.set({ "i", "x", "n", "s" }, "<leader>w", "<cmd>w<cr><esc>", { desc = "Save File" })

-- buffers
keymap.set("n", "<Tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap.set("n", "<S-Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
