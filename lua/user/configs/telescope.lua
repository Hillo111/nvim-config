local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "dist/*" },
  },
  pickers = {
    find_files = {
      hidden = true
    }
  },
  extensions = {
    -- ...
  }
}

