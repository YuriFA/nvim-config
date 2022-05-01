local lspconfig = require("lspconfig")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    source = "always", -- Or "if_many"
  }
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end
}

-- lspconfig.eslint.setup {
--   capabilities = capabilities,
-- }

-- css, html
for _, server in pairs({ "html", "cssls" }) do
  lspconfig[server].setup {
    capabilities = capabilities,
  }
end

lspconfig.jsonls.setup {
  capabilities = capabilities,
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end
}

-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      -- runtime = {
      --   -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
      --   version = 'LuaJIT',
      --   -- Setup your lua path
      --   path = runtime_path,
      -- },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
