--compile
-- Define the Run function
function Run()
    vim.cmd('w')
    vim.cmd('sp')
    vim.cmd('resize 30')
    if vim.bo.filetype == 'cpp' or vim.bo.filetype == 'cc' then
        vim.cmd('term g++ -O2 -std=c++17 -Wall -Wextra -Wfatal-errors -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Winvalid-pch % -o %<')
    elseif vim.bo.filetype == 'java' then
        vim.cmd('term javac %')
    elseif vim.bo.filetype == 'python' then
        vim.cmd('term python3 %')
    else
        vim.cmd('terminal')
    end
end

-- Define the Mode function
local fterm = require("FTerm")

function Mode()
    vim.cmd('w')
    if vim.bo.filetype == 'cpp' or vim.bo.filetype == 'cc' then
        vim.cmd('w')
        vim.cmd('cd %:p:h')  -- Change to the file's directory
        fterm.scratch({
            cmd = "./" .. vim.fn.expand('%:t:r')
        })
    elseif vim.bo.filetype == 'java' then
        vim.cmd('w')  -- Save the current file
        vim.cmd('cd %:p:h')  -- Change to the file's directory
        fterm.scratch({
            cmd = "java " .. vim.fn.expand('%:t:r')
        })
    end
end

function Check()
    vim.cmd('w')  -- Save the current file
    vim.cmd('cd %:p:h')  -- Change to the file's directory
    fterm.scratch({
        cmd = "judge ./" .. vim.fn.expand('%:t:r')
    })
end

--nvimtree
vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'L', ':bn<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'H', ':bp<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F6>', ':set hlsearch<CR>:/', {noremap = true})
vim.api.nvim_set_keymap('n', '<F7>', ':e ~/cslearning/cptemplate/', {noremap = true})
vim.api.nvim_set_keymap('n', 'x', ':bd<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'J', ':u<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F9>', ':lua Run()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F11>', ':lua Mode()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F3>', ':Trouble diagnostics toggle<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', { noremap = true })
vim.api.nvim_set_keymap('n', '<F10>', ':FTermToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<backspace>', ':noh<CR>', {noremap = true})

local function insert_template()
  -- Get the template path from the user
  local template_path = vim.fn.input("Template Path: ", "~/cslearning/cptemplate/templates/cp/", "file")
  
  -- Expand the path to handle `~`
  template_path = vim.fn.expand(template_path)
  
  -- Debugging: Print the expanded path
  print("Expanded Path: " .. template_path)
  
  -- Check if the file exists
  if vim.fn.filereadable(template_path) == 0 then
    vim.api.nvim_err_writeln("Error: Cannot open file " .. template_path)
    return
  end
  
  -- Read the content of the template file
  local content = vim.fn.readfile(template_path)
  
  -- Insert the content into the current buffer
  vim.api.nvim_put(content, "b", true, true)
  
  -- Go to the top of the file and delete the first line (optional, as per your initial request)
  vim.cmd("1")
  -- vim.cmd("d")
end

-- Make the function globally accessible
_G.insert_template = insert_template

vim.api.nvim_set_keymap('n', '<F8>', ':lua insert_template()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F12>', ':lua Check()<CR>', {noremap = true})


