local md2pdf_bin = "/home/qinghaohu/bin/md2pdf"

local function compile_markdown_to_pdf()
  if vim.bo.filetype ~= "markdown" then
    vim.notify("Md2Pdf only works for markdown buffers", vim.log.levels.WARN)
    return
  end

  vim.cmd("write")
  local input = vim.fn.expand("%:p")
  local output = vim.fn.expand("%:p:r") .. ".pdf"
  local cmd = string.format("%s %s %s", vim.fn.shellescape(md2pdf_bin), vim.fn.shellescape(input), vim.fn.shellescape(output))
  local result = vim.fn.system(cmd)

  if vim.v.shell_error == 0 then
    vim.notify("PDF created: " .. output, vim.log.levels.INFO)
  else
    vim.notify("md2pdf failed:\n" .. result, vim.log.levels.ERROR)
  end
end

vim.api.nvim_create_user_command("Md2Pdf", compile_markdown_to_pdf, {})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(args)
    local opts = { buffer = args.buf, noremap = true, silent = true }

    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.spell = true
    vim.opt_local.textwidth = 80

    vim.keymap.set("n", "<F9>", "<cmd>Md2Pdf<CR>", opts)
    vim.keymap.set("n", "<leader>mp", "<cmd>Md2Pdf<CR>", opts)
  end,
})
