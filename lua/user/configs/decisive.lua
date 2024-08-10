local decisive = require('decisive')
decisive.setup{}
vim.api.nvim_create_user_command('CSVFormat', function()
  decisive.align_csv({})
end, {})
