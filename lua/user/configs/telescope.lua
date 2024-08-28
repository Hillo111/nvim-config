local builtin = require('telescope.builtin')
local themes = require('telescope.themes')
local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "dist/*" },
  },
  pickers = {
    find_files = {
      hidden = true,
      mappings = {
        i = { ["<CR>"] = actions.select_tab_drop }
      }
    }
  },
  extensions = {
    -- ...
  }
}

