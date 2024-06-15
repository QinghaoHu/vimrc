local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = false

-- 光标行
-- opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "number"
--file
opt.backup = false
opt.swapfile = false
opt.compatible = false
opt.encoding = 'utf-8'
opt.backspace = '2'

vim.fn.sign_define('meow', { numhl = 'something' })
vim.fn.sign_place(2, '', 'meow', '', { lnum = 1 })
