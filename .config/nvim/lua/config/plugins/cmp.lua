local cmp = require 'cmp'
local snippy = require 'snippy'

cmp.setup {
  snippet = {
    expand = function(args)
      require('snippy').expand_snippet(args.body)
    end,
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete {}, { 'i', 'c' }),
    ['<CR>'] = cmp.mapping.confirm { select = false },
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i' }),
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i' }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif snippy.can_expand_or_advance() then
        snippy.expand_or_advance()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif snippy.can_jump(-1) then
        snippy.previous()
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = cmp.config.sources {
    { name = 'nvim_lsp' },
    { name = 'snippy' },
    { name = 'path' },
    { name = 'buffer' },
  },
}
