local ok, null_ls = pcall(require, "null-ls")

if not ok then
   return
end

local sources = {
   null_ls.builtins.formatting.prettierd.with {
    filetypes = { "html", "json", "markdown", "scss", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
    prefer_local = "node_modules/.bin",
   },
   -- null_ls.builtins.diagnostics.eslint_d.with {
   --   prefer_local = "node_modules/.bin",
   -- },
   null_ls.builtins.diagnostics.eslint.with {
     prefer_local = "node_modules/.bin",
   },
}

local M = {}
M.setup = function(on_attach)
  null_ls.setup {
    debug = true,
    sources = sources,
    diagnostics_format = "[#{c}] #{m} (#{s})"
  }
end

return M
