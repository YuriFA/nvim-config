return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        markdown = false,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      -- make sure mason installs the server
      servers = {
        marksman = {
          enabled = false,
        },
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
        cssls = {
          settings = {
            css = {
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
        },
        tailwindcss = {
          settings = {
            tailwindCSS = {
              classFunctions = { "tv", "cn" },
              classAttributes = { "class", "className", "classList", "ngClass", "[a-zA-Z]*ClassNames?" },
              experimental = {
                classRegex = {
                  { "(`.*?`)", '(".*?")', "('.*?')" },
                },
              },
            },
          },
        },
      },
    },
  },
}
