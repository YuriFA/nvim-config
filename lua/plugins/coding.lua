return {
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },

  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      require("git-conflict").setup({
        debug = false,
        default_mappings = true, -- disable buffer local mapping created by this plugin
        disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
        highlights = { -- They must have background color, otherwise the default color will be used
          incoming = "DiffText",
          current = "DiffAdd",
        },
      })
    end,
  },

  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     {
  --       "tzachar/cmp-ai",
  --       dependencies = "nvim-lua/plenary.nvim",
  --
  --       config = function()
  --         local cmp_ai = require("cmp_ai.config")
  --
  --         cmp_ai:setup({
  --           max_lines = 100,
  --           provider = "Ollama",
  --           provider_options = {
  --             model = "codellama:7b-code",
  --           },
  --           notify = true,
  --           notify_callback = function(msg)
  --             vim.notify(msg)
  --           end,
  --           run_on_every_keystroke = true,
  --           ignored_file_types = {
  --             -- default is not to ignore
  --             -- uncomment to ignore in lua:
  --             -- lua = true
  --           },
  --         })
  --       end,
  --     },
  --   },
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     table.insert(opts.sources, 1, {
  --       name = "cmp_ai",
  --       group_index = 1,
  --       priority = 100,
  --     })
  --
  --     opts.formatting = {
  --       format = function(entry, item)
  --         local icons = LazyVim.config.icons.kinds
  --         if icons[item.kind] then
  --           item.kind = icons[item.kind] .. item.kind
  --         end
  --
  --         if entry.source.name == "cmp_ai" then
  --           item.menu = "[AI]"
  --
  --           local detail = (entry.completion_item.labelDetails or {}).detail
  --           item.kind = ""
  --           if detail and detail:find(".*%%.*") then
  --             item.kind = item.kind .. " " .. detail
  --           end
  --
  --           if (entry.completion_item.data or {}).multiline then
  --             item.kind = item.kind .. " " .. "[ML]"
  --           end
  --         end
  --
  --         return item
  --       end,
  --     }
  --   end,
  -- },
}
