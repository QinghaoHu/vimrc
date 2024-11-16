vim.o.guifont = "DejaVu Sans Mono for Powerline:h9"
require ("core.options")
require ("plugins.lazy")
require ("plugins.nvim-tree")
-- require ("plugins.treesitter")
require ("plugins.lsp")
require ("plugins.cmp")
require ("plugins.comment")
require ("plugins.autopairs")
require ("plugins.ibl")
require ("plugins.luasnip")
require ("plugins.kanagawa")
-- require ("plugins.noice")
require ("plugins.telescope")
require ("plugins.dashboard")
-- require ("plugins.monokai")
-- require ("plugins.gruvbox")
-- require ("plugins.solarizedlua")
-- require ("plugins.golden")
require ("plugins.bufferlines")
require("plugins.fterm")
require ("plugins.lualine")
require ("core.keymaps")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

vim.g.neovide_cursor_animation_length = 0
