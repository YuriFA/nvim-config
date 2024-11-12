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
  --   "David-Kunz/gen.nvim",
  --   opts = {
  --     model = "codestral", -- The default model to use.
  --     host = "localhost", -- The host running the Ollama service.
  --     port = "11434", -- The port on which the Ollama service is listening.
  --     quit_map = "q", -- set keymap for close the response window
  --     retry_map = "<c-r>", -- set keymap to re-send the current prompt
  --     init = function(options)
  --       pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
  --     end,
  --     -- Function to initialize Ollama
  --     command = function(options)
  --       local body = { model = options.model, stream = true }
  --       return "curl --silent --no-buffer -X POST http://"
  --         .. options.host
  --         .. ":"
  --         .. options.port
  --         .. "/api/chat -d $body"
  --     end,
  --     -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
  --     -- This can also be a command string.
  --     -- The executed command must return a JSON object with { response, context }
  --     -- (context property is optional).
  --     -- list_models = '<omitted lua function>', -- Retrieves a list of model names
  --     display_mode = "float", -- The display mode. Can be "float" or "split" or "horizontal-split".
  --     show_prompt = true, -- Shows the prompt submitted to Ollama.
  --     show_model = true, -- Displays which model you are using at the beginning of your chat session.
  --     no_auto_close = false, -- Never closes the window automatically.
  --     debug = false, -- Prints errors and the command which is run.
  --   },
  -- },

  -- {
  --   "nomnivore/ollama.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --
  --   -- All the user commands added by the plugin
  --   cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
  --
  --   keys = {
  --     -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
  --     {
  --       "<leader>oo",
  --       ":<c-u>lua require('ollama').prompt()<cr>",
  --       desc = "ollama prompt",
  --       mode = { "n", "v" },
  --     },
  --
  --     -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
  --     {
  --       "<leader>oG",
  --       ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
  --       desc = "ollama Generate Code",
  --       mode = { "n", "v" },
  --     },
  --   },
  --
  --   ---@type Ollama.Config
  --   opts = {
  --     -- your configuration overrides
  --   },
  -- },

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
