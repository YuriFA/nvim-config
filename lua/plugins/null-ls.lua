local ok, null_ls = pcall(require, "null-ls")
local command_resolver = require("null-ls.helpers.command_resolver")

if not ok then
  return
end

local sources = {
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.prettier.with {
    filetypes = {
      "html",
      "json",
      "markdown",
      "scss",
      "css",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      'svelte',
      'yaml',
      'markdown',
      'markdown.mdx',
    },
  },
}

local M = {}
M.setup = function()
  null_ls.setup {
    debug = true,
    sources = sources,
    diagnostics_format = "[#{c}] #{m} (#{s})"
  }
end

return M
