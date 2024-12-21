-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- save file
keymap.set("n", "<leader>w", "<cmd>w<cr><esc>", opts)

-- buffers
-- keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
-- keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })

-- formatting
keymap.set({ "n", "v" }, "<leader>F", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
keymap.set("n", "]g", diagnostic_goto(true), { desc = "Next Diagnostic" })
keymap.set("n", "[g", diagnostic_goto(false), { desc = "Prev Diagnostic" })

-- FZF
keymap.set("n", "<leader>fw", ":Rg<CR>", opts)
-- for disable double esc bug when using Rg
-- keymap.del("t", "<esc><esc>")
