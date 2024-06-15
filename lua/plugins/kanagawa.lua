require("kanagawa").setup({
  commentStyle = { italic = false },
  keywordStyle = { italic = false },
  overrides = function()
    return {
      ["@variable.builtin"] = { italic = false },
    }
  end
})

-- To disable highlights for supported plugin(s), call the `with_config` function **before** setting the colorscheme.
-- These are the defaults.
require('base16-colorscheme').with_config({
    telescope = true,
    indentblankline = true,
    notify = true,
    ts_rainbow = true,
    cmp = true,
    illuminate = true,
    dapui = true,
})

-- vim.cmd[[colorscheme kanagawa-wave]]
vim.cmd[[colorscheme gruvbox8]]

