vim.o.background = 'light'

-- default config
require('solarized').setup({
    transparent = false, -- enable transparent background
    palette = 'solarized', -- or selenized
    styles = {
      comments = {},
      functions = {},
      variables = {},
      numbers = {},
      constants = {},
      parameters = {},
      keywords = {},
      types = {},
    },
    enables = {
      bufferline = true,
      cmp = true,
      diagnostic = true,
      dashboard = true,
      editor = true,
      gitsign = true,
      hop = true,
      indentblankline = true,
      lsp = true,
      lspsaga = true,
      navic = true,
      neogit = true,
      neotree = true,
      notify = true,
      noice = true,
      semantic = true,
      syntax = true,
      telescope = true,
      tree = true,
      treesitter = true,
      todo = true,
      whichkey = true,
      mini = true,
    },
    highlights = {},
    colors = {},
    theme = 'neo', -- or 'neo'
    autocmd = true,
    styles = {
      comments = { italic = false, bold = false },
      functions = { italic = false },
      variables = { italic = false },
    }
})

vim.cmd.colorscheme = 'solarized' -- or selenized
