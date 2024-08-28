local opts = { noremap = true, silent = true }

local builtin = require('telescope.builtin')
vim.keymap.set('', '<C-p>', builtin.find_files, opts)
vim.keymap.set('', '<C-f>', builtin.live_grep, opts)
vim.keymap.set('', '<leader>his', builtin.git_bcommits, opts)
vim.keymap.set('', '<leader>b', builtin.git_branches, opts)

vim.keymap.set('t', '<Esc>', '<C-n><C-\\><C-n>')
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', opts)

vim.keymap.set('n', '<A-e>', ':NvimTreeFocus<CR>', opts)

-- vim.keymap.set('n', ':cd *')
vim.keymap.set('n', '<leader>e', ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>', opts)
vim.keymap.set('i', '<C-e>', '<esc>:lua vim.diagnostic.open_float(0, {scope="line"})<CR>a', opts)

vim.keymap.set('n', '<leader>g', ':DiffviewOpen ', opts)

-- Tab controls
vim.keymap.set('n', '<A-w>', ':tabclose<CR>', opts) -- opt-w

vim.keymap.set({'n', 'v'}, '<leader>?',	':Gen<CR>', opts)
vim.keymap.set('n', '<leader>nav', ':Navbuddy<CR>', opts)

vim.keymap.set('n', '<A-,>', 'gT', opts)
vim.keymap.set('n', '<A-.>', 'gt', opts)
for i = 1, 9 do
	vim.keymap.set('n', '<A-' .. i .. '>', ':' .. i .. 'tabnext<CR>', opts)
end

vim.keymap.set('n', '<leader>>', ':+tabmove<CR>', opts)
vim.keymap.set('n', '<leader><', ':-tabmove<CR>', opts)

vim.keymap.set('n', '<leader>c<CR>', ':NoiceDismiss<CR>', opts)

vim.keymap.set('n', '<C-a>', 'ggVG', opts)
vim.keymap.set('n', 'Y', '\"*y', opts)
vim.keymap.set('v', 'Y', '\"*y', opts)

vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false
})

vim.api.nvim_create_user_command('ColorPick', 'PickColorInsert', {})

-- vim.api.nvim_create_user_command('DAPToggleBP', 'lua require"dap".toggle_breakpoint()', {})
-- vim.api.nvim_create_user_command('DAPContinue', 'lua require"dap".continue()', {});
-- vim.api.nvim_create_user_command('DAPStepOver', 'lua require"dap".step_over()', {});
-- vim.api.nvim_create_user_command('DAPStepInto', 'lua require"dap".step_into()', {});
-- vim.api.nvim_create_user_command('DAPREPL', 'lua require"dap".repl.open()', {});
vim.g.copilot_no_tab_map = true
