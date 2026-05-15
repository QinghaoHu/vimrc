require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "clangd",
    "jdtls",
    "vimls",
    "texlab",
    "marksman",
  },
  automatic_enable = false,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local jdtls_cache = vim.fn.stdpath("cache") .. "/jdtls"
local jdtls_workspace = jdtls_cache .. "/workspace"
local jdtls_config = jdtls_cache .. "/config"
vim.fn.mkdir(jdtls_workspace, "p")
vim.fn.mkdir(jdtls_config, "p")

local function jdtls_root_dir(arg)
  local fname = arg
  if type(arg) == "number" then
    fname = vim.api.nvim_buf_get_name(arg)
  end

  if type(fname) ~= "string" or fname == "" then
    return vim.loop.cwd()
  end

  return vim.fs.root(fname, {
    ".project",
    ".classpath",
    "gradlew",
    "mvnw",
    "pom.xml",
    "build.gradle",
    "build.gradle.kts",
    "settings.gradle",
    "settings.gradle.kts",
    ".git",
  }) or vim.fs.dirname(fname)
end

vim.lsp.config("clangd", {
  capabilities = capabilities,
  cmd = { "clangd", "--header-insertion=never", "--background-index", "--clang-tidy=false" },
})
vim.lsp.enable("clangd")

vim.lsp.config("jdtls", {
  capabilities = capabilities,
  filetypes = { "java" },
  single_file_support = true,
  root_dir = jdtls_root_dir,
  cmd = function(dispatchers, config)
    local root_dir = config.root_dir or vim.loop.cwd()
    local project_name = vim.fs.basename(root_dir)
    local workspace_dir = vim.fs.joinpath(jdtls_workspace, project_name)
    vim.fn.mkdir(workspace_dir, "p")

    return vim.lsp.rpc.start({
      vim.fn.stdpath("data") .. "/mason/bin/jdtls",
      "-configuration",
      jdtls_config,
      "-data",
      workspace_dir,
    }, dispatchers, {
      cwd = config.cmd_cwd,
      env = config.cmd_env,
      detached = config.detached,
    })
  end,
})
vim.lsp.enable("jdtls")

vim.lsp.config("texlab", {
  capabilities = capabilities,
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
vim.lsp.enable("texlab")

vim.lsp.config("marksman", {
  capabilities = capabilities,
})
vim.lsp.enable("marksman")
