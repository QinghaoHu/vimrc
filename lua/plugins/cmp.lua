local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip.loaders.from_vscode").lazy_load()

-- 下面会用到这个函数
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end
-- Function to handle <Tab> key
local function tab_complete()
  if ls.expand_or_jumpable() then
    return "<Plug>luasnip-expand-or-jump"
  else
    return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
  end
end

local ls = require('luasnip')
-- Function to handle <S-Tab> key
local function shift_tab_complete()
  if ls.jumpable(-1) then
    return "<Plug>luasnip-jump-prev"
  else
    return vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true)
  end
end

local function shift_tab_complete()
  if ls.jumpable(-1) then
    return "<Plug>luasnip-jump-prev"
  else
    return vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true)
  end
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
     ['<Tab>'] = cmp.mapping(function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif ls.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif ls.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end, { 'i', 's' }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  }),

  -- 这里重要
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  })
})


vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', {expr = true, noremap = true})
vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', {expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.shift_tab_complete()', {expr = true, noremap = true})
vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.shift_tab_complete()', {expr = true, noremap = true})

