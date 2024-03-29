local builtin = require('telescope.builtin')

vim.keymap.set('', '<C-p>', builtin.find_files, {})
vim.keymap.set('', '<C-f>', builtin.live_grep, {})
vim.keymap.set('t', '<Esc>', '<C-n><C-\\><C-n>')
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')
vim.keymap.set('n', '<C-n>', ':NERDTree | NERDTreeCWD<CR>')

-- vim.keymap.set('n', ':cd *')
vim.keymap.set('n', '<space>e', ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>')
vim.keymap.set('i', '<C-e>', '<esc>:lua vim.diagnostic.open_float(0, {scope="line"})<CR>a')

vim.keymap.set('n', '*', '*N')

vim.cmd([[inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"]])

vim.keymap.set('n', '<leader>dif', ':DiffviewOpen<CR>')

-- Tab controls
vim.keymap.set('n', '˚', ':tabnext<CR>') -- opt-k
vim.keymap.set('n', '∆', ':tabprevious<CR>') -- opt-j
vim.keymap.set('n', '∑', ':tabclose<CR>') -- opt-w
vim.keymap.set('n', '†', ':tabnew<CR>') -- opt-t

vim.keymap.set({'n', 'v'}, '<leader>?',	':Gen<CR>')
vim.keymp.set('n', '<leader>nav', ':Navbuddy<CR>')
