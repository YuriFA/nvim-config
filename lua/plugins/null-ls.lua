local ok, null_ls = pcall(require, "null-ls")
local command_resolver = require("null-ls.helpers.command_resolver")

if not ok then
  return
end

local sources = {
  null_ls.builtins.formatting.prettier.with {
    filetypes = { "html", "json", "markdown", "scss", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
    -- prefer_local = "node_modules/.bin",
    dynamic_command = function(params)
      return command_resolver.from_yarn_pnp(params)
          or command_resolver.from_node_modules(params)
          or vim.fn.executable(params.command) == 1 and params.command
    end,
  },
  -- null_ls.builtins.diagnostics.eslint_d.with {
  -- null_ls.builtins.diagnostics.eslint.with {
  --   -- prefer_local = "node_modules/.bin",
  --   timeout = 30000,
  --   dynamic_command = function(params)
  --     return command_resolver.from_yarn_pnp(params)
  --         or command_resolver.from_node_modules(params)
  --         or vim.fn.executable(params.command) == 1 and params.command
  --   end,
  -- },
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
