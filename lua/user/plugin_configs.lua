local configs_dir = vim.fn.stdpath('config') .. '/lua/user/configs/'
local files = vim.fn.glob(configs_dir .. '*.lua', false, true)

for _, file in ipairs(files) do
  local name = file:match('.+/(.+).lua')
  require('user.configs.' .. name)
end
