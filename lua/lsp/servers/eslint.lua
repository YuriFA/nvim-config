local M = {}

local function get_cmd(cmd)
    local lspconfig = require('lspconfig')
    local new_cmd = cmd

    local buffer_location = vim.api.nvim_buf_get_name(0)

    local pnpm = lspconfig.util.root_pattern('pnpm-lock.yml', 'pnpm-lock.yaml')(
                     buffer_location)

    local yarn2 = lspconfig.util.root_pattern('.pnp.cjs', '.pnp.js')(
                      buffer_location)

    local lsp_cmd = cmd[1]
    local cmd_args = {unpack(cmd, 2)}

    if pnpm and vim.fn.executable('pnpm') == 1 then
        new_cmd = {"pnpm", "exec", lsp_cmd, unpack(cmd_args)}
    end
    --
    if yarn2 and vim.fn.executable('yarn') == 1 then
        new_cmd = {"yarn", "exec", lsp_cmd, unpack(cmd_args)}
    end
    return new_cmd
end

local eslint_config = require("lspconfig.server_configurations.eslint")
local cmd = eslint_config.default_config.cmd

M.on_new_config = function(config, new_root_dir)
    eslint_config.default_config.on_new_config(config, new_root_dir)
    config.cmd = get_cmd(cmd)
end

local on_attach = function(client, bufnr)
  client.resolved_capabilities.document_formatting = true
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

M.on_attach = on_attach;

M.settings = {
  codeAction = {
    disableRuleComment = {
      enable = true,
      location = "separateLine"
    },
    showDocumentation = {
      enable = true
    }
  },
  codeActionOnSave = {
    enable = false,
    mode = "all"
  },
  format = true,
  nodePath = "",
  onIgnoredFiles = "off",
  packageManager = "npm",
  quiet = false,
  rulesCustomizations = {},
  run = "onType",
  useESLintClass = false,
  validate = "on",
  workingDirectory = {
    mode = "location"
  }
}

return M
