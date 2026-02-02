require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
    "clangd",
    "jdtls",
    "vimls",
	"texlab",
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- require("lspconfig").lua_ls.setup {
--   capabilities = capabilities,
-- }
--
--

-- 1) clangd
vim.lsp.config('clangd', {
  capabilities = capabilities,
  cmd = { "clangd", "--header-insertion=never", "--background-index", "--clang-tidy=false" },
})
vim.lsp.enable('clangd')

-- 2) jdtls
vim.lsp.config('jdtls', {
  capabilities = capabilities,
})
vim.lsp.enable('jdtls')

-- 3) vimls（你原来注释掉的，保留同等注释）
-- vim.lsp.config('vimls', {
--   capabilities = capabilities,
-- })
-- vim.lsp.enable('vimls')

-- 4) texlab
vim.lsp.config('texlab', {
  settings = {
    texlab = {
      build = {
        executable = "latexmk",
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        onSave = true,
        forwardSearchAfter = true,
      },
      forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
    },
  },
})
vim.lsp.enable('texlab')

