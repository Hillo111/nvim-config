local builtin = require('telescope.builtin')
local themes = require('telescope.themes')
local opts = { noremap = true, silent = true }

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
vim.keymap.set('n', '<leader>>', ':+tabmove<CR>', opts)
vim.keymap.set('n', '<leader><', ':-tabmove<CR>', opts)

vim.keymap.set('n', '<leader>c<CR>', ':NoiceDismiss<CR>', opts)

vim.keymap.set('n', 'Y', '\"*y')
