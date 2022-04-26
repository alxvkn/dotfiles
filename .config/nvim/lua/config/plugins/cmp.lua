local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('snippy').expand_snippet(args.body)
    end,
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<CR>'] = cmp.mapping.confirm { select = true },
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i' }),
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i' }),
  },
  sources = cmp.config.sources {
    { name = 'nvim_lsp' },
    { name = 'snippy' },
    { name = 'path' },
    { name = 'buffer' },
  },
}
