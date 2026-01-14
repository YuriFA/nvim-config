return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      -- make sure mason installs the server
      servers = {
        ["*"] = {
          keys = {
            { "<leader>ca", false },
            { "<leader>ac", vim.lsp.buf.code_action, desc = "Code Action", has = "codeAction" },
            { "<leader>cr", false },
            -- "<leader>rn", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
            {
              "<leader>rn",
              function()
                local inc_rename = require("inc_rename")
                return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
              end,
              expr = true,
              desc = "Rename (inc-rename.nvim)",
              has = "rename",
            },
          },
        },
      },
    },
  },
}
