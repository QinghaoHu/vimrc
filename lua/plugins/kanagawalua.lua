-- kanagawa.lua
local kanagawa = {}

kanagawa.colors = {
  bg = "#1f1f28",
  fg = "#dcd7ba",
  -- Define more colors here based on the kanagawa theme
  red = "#c34043",
  green = "#76946a",
  yellow = "#dca561",
  blue = "#7fb4ca",
  magenta = "#957fb8",
  cyan = "#6a9589",
  white = "#c8c093",
  black = "#090618",
}

kanagawa.setup = function()
  local colors = kanagawa.colors

  -- General settings
  vim.cmd("highlight clear")
  vim.cmd("set termguicolors")
  vim.o.background = "dark"
  vim.g.colors_name = "kanagawa"

  -- Neovim highlights
  vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
  vim.api.nvim_set_hl(0, "Comment", { fg = colors.green, bg = colors.bg, italic = true })
  -- Define more highlight groups based on kanagawa theme

  -- Lualine settings
  require('lualine').setup {
    options = {
      theme = {
        normal = {
          a = { fg = colors.bg, bg = colors.blue, gui = 'bold' },
          b = { fg = colors.blue, bg = colors.black },
          c = { fg = colors.fg, bg = colors.bg },
        },
        -- Define more lualine settings
      }
    }
  }

  -- nvim-tree settings
  require'nvim-tree'.setup {
    renderer = {
      highlight_opened_files = "all",
      highlight_git = true,
      root_folder_modifier = ":t",
    },
    view = {
      width = 30,
      side = 'left',
    }
  }
  vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = colors.blue })
  -- Define more nvim-tree highlight groups

  -- Treesitter settings
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
  vim.api.nvim_set_hl(0, "TSComment", { fg = colors.green, bg = colors.bg, italic = true })
  -- Define more treesitter highlight groups

  -- LSP settings
  vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultError", { fg = colors.red })
  vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultWarning", { fg = colors.yellow })
  -- Define more LSP highlight groups
end

return kanagawa
