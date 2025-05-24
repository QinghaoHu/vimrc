-- vim.o.guifont = "FiraCode Nerd Font:h9"
-- vim.o.guifont = "DejaVuSansM Nerd Font:h9"
-- vim.o.guifont = "DejaVu Sans Mono for Powerline:h9"

require ("core.options")
require ("plugins.lazy")
require ("plugins.nvim-tree")
require ("plugins.lsp")
require ("plugins.cmp")
require ("plugins.comment")
require ("plugins.autopairs")
require ("plugins.ibl")
require("plugins.onedark")
require("plugins.kanagawa")
-- require ("plugins.solarizedlua")
require ("plugins.luasnip")
require ("plugins.bufferlines")
require ("plugins.fterm")
require ("plugins.lualine")
require ("plugins.scrollbar")
require ("core.keymaps")
--require ("plugins.noice")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)
