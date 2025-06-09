return {
  {
    enabled = false,
    "folke/flash.nvim",
  },

  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf", build = ":call fzf#install()" },
  },

  {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      opts["defaults"]["header"] = false
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
      },
      filesystem = {
        filtered_items = {
          -- visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false, -- only works on Windows for hidden files/directories
        },
      },
      sort_function = (function()
        -- Custom order for folders in FSD project
        local folder_order = {
          ["app"] = 0,
          ["processes"] = 1,
          ["pages"] = 2,
          ["views"] = 2, -- Same priority as pages
          ["widgets"] = 3,
          ["features"] = 4,
          ["entities"] = 5,
          ["shared"] = 6,
        }

        -- Функция для проверки, является ли путь частью FSD структуры
        local function is_fsd_path(path)
          local name = vim.fn.fnamemodify(path, ":t")
          return folder_order[name] ~= nil
        end

        -- Возвращаем функцию сортировки
        return function(a, b)
          -- If both are directories, check for FSD structure
          if a.type == "directory" and b.type == "directory" then
            local a_is_fsd = is_fsd_path(a.path)
            local b_is_fsd = is_fsd_path(b.path)
            
            -- If both are FSD directories, sort by order
            if a_is_fsd and b_is_fsd then
              local a_name = vim.fn.fnamemodify(a.path, ":t")
              local b_name = vim.fn.fnamemodify(b.path, ":t")
              return folder_order[a_name] < folder_order[b_name]
            -- If only a is FSD, it comes first
            elseif a_is_fsd then
              return true
            -- If only b is FSD, it comes first
            elseif b_is_fsd then
              return false
            end
          end

          -- Default sorting (directories first, then alphabetical)
          if a.type ~= b.type then
            return a.type < b.type
          else
            return a.path < b.path
          end
        end
      end)(),
    },
  },
}
