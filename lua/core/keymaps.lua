vim.g.mapleader = " "

local keymap = vim.keymap

--nvimtree

vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'L', ':bn<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'H', ':bp<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F6>', ':set hlsearch<CR>:/', {noremap = true})
vim.api.nvim_set_keymap('n', '<F7>', ':noh<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'x', ':bd<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F12>', ':w<CR>:sp<CR>:resize 10<CR>:term ./%< <', {noremap = true})
vim.api.nvim_set_keymap('n', 'J', ':u<CR>', {noremap = true})
