-- vim.o.guifont = "FiraCode Nerd Font:h9"
-- vim.o.guifont = "DejaVuSansM Nerd Font:h9"
vim.o.guifont = "DejaVu Sans Mono for Powerline:h9"

require ("core.options")
require ("plugins.lazy")
require ("plugins.nvim-tree")
require ("plugins.lsp")
require ("plugins.cmp")
require ("plugins.comment")
require ("plugins.autopairs")
require ("plugins.ibl")
require("plugins.onedark")
-- require ("plugins.solarizedlua")
-- vim.cmd[[colorscheme hardhacker]]
require("plugins.kanagawa")
-- require("plugins.kanagawaPaper")
-- require ("plugins.luasnip")
require ("plugins.bufferlines")
require ("plugins.fterm")
require ("plugins.lualine")
require ("core.keymaps")
require ("plugins.noice")
-- require("plugins.selenized-light")

if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
	vim.g.neovide_opacity = 0.95
	vim.g.neovide_normal_opacity = 0.95
	vim.g.neovide_position_animation_length = 0
	vim.g.neovide_cursor_animation_length = 0.00
	vim.g.neovide_cursor_trail_size = 0
	vim.g.neovide_cursor_animate_in_insert_mode = false
	vim.g.neovide_cursor_animate_command_line = false
	vim.g.neovide_scroll_animation_far_lines = 0
	vim.g.neovide_scroll_animation_length = 0.00
	vim.g.neovide_scroll_animation_length = 0 -- Disable smooth scrolling
	vim.g.neovide_refresh_rate = 60 -- Set FPS to 60
end

-- vim.g.remote_host = 'localhost'
-- vim.opt.linespace = 1
-- vim.cmd(":call serverstart('/tmp/nvimsocket')")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)
