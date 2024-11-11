-- vim.o.guifont = "FiraCode Nerd Font:h10"
vim.o.guifont = "Hack Nerd Font Mono:h9.5"
-- vim.o.guifont = "Monaco Nerd Font Regular:h6"
-- vim.o.guifont = "UbuntuMono Nerd Font Mono:h7.5"
-- vim.o.guifont = "UbuntuSansMono Nerd Font Mono:h12"
-- vim.o.guifont = "Inconsolata Nerd Font Mono:h12"
-- vim.o.guifont = "VictorMono NFM:h6"
-- vim.o.guifont = "MonaspiceXe Nerd Font Mono:h6"
-- vim.o.guifont = "Consolas:h11"
require ("core.options")
require ("plugins.lazy")
require ("plugins.lualine")
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
require ("core.keymaps")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

vim.g.neovide_cursor_animation_length = 0
