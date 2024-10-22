local opts = { noremap = true, silent = true }
local keyset = vim.keymap.set

local builtin = require('telescope.builtin')
keyset('', '<C-p>', builtin.find_files, opts)
keyset('', '<C-f>', builtin.live_grep, opts)
keyset('', '<leader>his', builtin.git_bcommits, opts)
keyset('', '<leader>b', builtin.git_branches, opts)

keyset('t', '<Esc>', '<C-n><C-\\><C-n>')
keyset('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)

keyset('n', '<A-e>', '<cmd>NvimTreeFocus<CR>', opts)

-- keyset('n', '<cmd>cd *')
keyset('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>', opts)
keyset('i', '<C-e>', '<esc><cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>a', opts)

keyset('n', '<leader>g', ':DiffviewOpen ', opts)

-- Tab controls
keyset('n', '<A-w>', '<cmd>tabclose<CR>', opts) -- opt-w

keyset({'n', 'v'}, '<leader>?',	'<cmd>Gen<CR>', opts)
keyset('n', '<leader>nav', '<cmd>Navbuddy<CR>', opts)

keyset('n', '<A-,>', 'gT', opts)
keyset('n', '<A-.>', 'gt', opts)
for i = 1, 9 do
	keyset('n', '<A-' .. i .. '>', '<cmd>' .. i .. 'tabnext<CR>', opts)
end

keyset('n', '<leader>>', '<cmd>+tabmove<CR>', opts)
keyset('n', '<leader><', '<cmd>-tabmove<CR>', opts)

keyset('n', '<leader>c<CR>', '<cmd>NoiceDismiss<CR>', opts)

keyset('n', '<C-a>', 'ggVG', opts)
keyset('n', 'Y', '\"*y', opts)
keyset('v', 'Y', '\"*y', opts)

keyset('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false
})

vim.api.nvim_create_user_command('ColorPick', 'PickColorInsert', {})

keyset('n', '<leader>-', '<cmd>Yazi<CR>', opts)

keyset('n', '<C-q>', '<cmd>qa<CR>', opts)

-- vim.api.nvim_create_user_command('DAPToggleBP', 'lua require"dap".toggle_breakpoint()', {})
-- vim.api.nvim_create_user_command('DAPContinue', 'lua require"dap".continue()', {});
-- vim.api.nvim_create_user_command('DAPStepOver', 'lua require"dap".step_over()', {});
-- vim.api.nvim_create_user_command('DAPStepInto', 'lua require"dap".step_into()', {});
-- vim.api.nvim_create_user_command('DAPREPL', 'lua require"dap".repl.open()', {});
vim.g.copilot_no_tab_map = true
