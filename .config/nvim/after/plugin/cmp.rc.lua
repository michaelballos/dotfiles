local present, cmp = pcall(require, 'cmp')
if (not present) then
  return
end
local lspkind = require 'lspkind'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  sources = cmp.config.sources({
    { name = 'path'},
    { 
      name = 'nvim_lsp', 
      keyword_length = 3 
    },
    { 
      name = 'buffer', 
      keyword_length = 3 
    },
    { 
      name = 'luasnip', 
      keyword_length = 2 
    },
  }),
  formatting = {
    format = lspkind.cmp_format({ 
      with_text = false, 
      maxwidth = 50 
    })
  }
})

-- " Use <Tab> and <S-Tab> to navigate through popup menu
-- ignoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- ignoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
