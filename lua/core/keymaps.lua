vim.g.mapleader = " "
--compile
-- Define the Run function
function Run()
    vim.cmd('w')
    vim.cmd('sp')
    vim.cmd('resize 10')
    if vim.bo.filetype == 'cpp' or vim.bo.filetype == 'cc' then
        vim.cmd('term g++ -O2 -std=c++17 -Wall -Wextra -Wfatal-errors % -o %<')
    elseif vim.bo.filetype == 'java' then
        vim.cmd('term javac %')
    elseif vim.bo.filetype == 'python' then
        vim.cmd('term python3 %')
    else
        vim.cmd('terminal')
    end
end

-- Define the Mode function
function Mode()
    vim.cmd('w')
    if vim.bo.filetype == 'cpp' or vim.bo.filetype == 'cc' then
        vim.cmd('w')
        vim.cmd('sp')
        vim.cmd('resize 10')
        vim.cmd('term ./%<')
    elseif vim.bo.filetype == 'java' then
        vim.cmd('w')
        vim.cmd('sp')
        vim.cmd('resize 10')
        vim.cmd('term java %<')
    end
end

--nvimtree
vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'L', ':bn<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'H', ':bp<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F6>', ':set hlsearch<CR>:/', {noremap = true})
vim.api.nvim_set_keymap('n', '<F7>', ':noh<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'x', ':bd<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F12>', ':w<CR>:sp<CR>:resize 10<CR>:term ./%< <', {noremap = true})
vim.api.nvim_set_keymap('n', 'J', ':u<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<F9>', ':lua Run()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F11>', ':lua Mode()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F8>', ':!cp /home/qinghaoh/Templates/code/c++/Template.cpp ', { noremap = true })
vim.api.nvim_set_keymap('n', '<F3>', ':TroubleToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', { noremap = true })
vim.api.nvim_set_keymap('n', '<F10>', ':cd %:p:h<CR>:sp<CR>:resize 10<CR>:terminal<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true })
