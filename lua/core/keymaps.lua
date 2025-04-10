--compile
-- Define the Run function
function Run()
    vim.cmd('w')
    vim.cmd('sp')
    vim.cmd('resize 30')
    if vim.bo.filetype == 'cpp' or vim.bo.filetype == 'cc' then
        vim.cmd('term time g++ -O2 -std=c++2b -Wall -Wextra -Wfatal-errors -Wshadow -Wformat=2 -Wfloat-equal -DLOCAL -Wconversion -Winvalid-pch % -o %<')
        vim.cmd('200')
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
            cmd = "time ./" .. vim.fn.expand('%:t:r')
        })
    elseif vim.bo.filetype == 'java' then
        vim.cmd('w')  -- Save the current file
        vim.cmd('cd %:p:h')  -- Change to the file's directory
        fterm.scratch({
            cmd = "java " .. vim.fn.expand('%:t:r')
        })
    end
end

function Mod()
    vim.cmd('w')
    if vim.bo.filetype == 'cpp' or vim.bo.filetype == 'cc' then
        vim.cmd('!alacritty -e "./%<"');
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
vim.api.nvim_set_keymap('n', '<F10>', ':cd %:p:h<CR>:FTermToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<backspace>', ':noh<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<f2>', ':NvimTreeToggle<CR>', {noremap = true})

vim.keymap.set("n", "D", '"_D')
vim.keymap.set("n", "dd", '"_dd')
vim.keymap.set("n", "dw", '"_dw')
vim.keymap.set("i", "jk", "<ESC>")

local function insert_template()
  local template_path = vim.fn.input("Template Path: ", "~/cslearning/cptemplate/templates/competitive Programming Templates/", "file")
  template_path = vim.fn.expand(template_path)
  if vim.fn.filereadable(template_path) == 0 then
    vim.api.nvim_err_writeln("Error: Cannot open file " .. template_path)
    return
  end
  local content = vim.fn.readfile(template_path)
  vim.api.nvim_put(content, "b", true, true)
  vim.cmd("1")
end

-- Make the function globally accessible
_G.insert_template = insert_template

vim.api.nvim_set_keymap('n', '<F8>', ':lua insert_template()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F12>', ':lua Check()<CR>', {noremap = true})


-- Define two color schemes and their background preferences
local colorschemes = {
  { name = "kanagawa", background = "dark" },
  { name = "onedark", background = "dark" },
  { name = "vscode", background = "dark" },
}

local current_index = 1

-- Function to toggle color scheme and background
local function toggle_colorscheme()
  current_index = current_index % #colorschemes + 1
  local cs = colorschemes[current_index]

  -- Set background before setting the colorscheme
  vim.o.background = cs.background

  local ok, err = pcall(vim.cmd.colorscheme, cs.name)
  if not ok then
    vim.notify("Colorscheme '" .. cs.name .. "' not found!", vim.log.levels.ERROR)
  else
    vim.notify("Switched to: " .. cs.name .. " (" .. cs.background .. ")", vim.log.levels.INFO)
  end
end

-- Map the toggle function to <leader>cs
vim.keymap.set("n", "<f5>", toggle_colorscheme, { desc = "Toggle Colorscheme + Background" })
