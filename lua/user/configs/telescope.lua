local builtin = require('telescope.builtin')
local themes = require('telescope.themes')
local actions = require('telescope.actions')

local telescope = require('telescope')

telescope.setup{
  defaults = {
    file_ignore_patterns = { "dist/*", 'bin/*', 'node_modules/*', 'lib/*', '.git/*' },
  },
  pickers = {
    find_files = {
      hidden = true,
      mappings = {
        i = { ["<CR>"] = actions.select_tab_drop }
      }
    },
    live_grep = {
      hidden = true,
      mappings = {
        i = { ["<CR>"] = actions.select_tab_drop }
      }
    },
  },
  extensions = {
    emoji = {
      action = function(emoji)
        vim.api.nvim_put({ emoji.value }, 'c', false, true)
      end,
    }
  }
}

telescope.load_extension('emoji')

