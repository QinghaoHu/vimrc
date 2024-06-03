-- vim.o.guifont = "FiraCode Nerd Font Mono:h10.5"
-- vim.o.guifont = "Hack Nerd Font Mono:h10.5"
-- vim.o.guifont = "Monaco Nerd Font Regular:h10"
-- vim.o.guifont = "UbuntuMono Nerd Font Mono:h13"
-- vim.o.guifont = "UbuntuSansMono Nerd Font Mono:h12"
vim.o.guifont = "Inconsolata Nerd Font Mono:h13"
-- vim.o.guifont = "Consolas:h11"

require ("core.options")
require ("core.keymaps")
require ("plugins.lazy")
require ("plugins.lualine")
require ("plugins.nvim-tree")
require ("plugins.treesitter")
require ("plugins.lsp")
require ("plugins.cmp")
require ("plugins.comment")
require ("plugins.autopairs")
require ("plugins.ibl")
require ("plugins.bufferlines")
require ("plugins.luasnip")
require ("plugins.kanagawa")
require ("plugins.noice")
require ("plugins.telescope")
require ("plugins.dashboard")
-- require ("plugins.golden")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)
