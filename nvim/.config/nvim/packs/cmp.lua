return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    'f3fora/cmp-spell',
    'onsails/lspkind.nvim',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local lspkind = require 'lspkind'

    cmp.setup {
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = {
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete {}, { 'i', 'c' }),
        ['<C-z>'] = cmp.mapping(cmp.mapping.complete {}, { 'i', 'c' }),
        ['<CR>'] = cmp.mapping.confirm { select = false },
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i' }),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i' }),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'spell' },
        { name = 'buffer' },
      },
      formatting = {
        format = lspkind.cmp_format {
          mode = 'symbol_text',
          preset = 'codicons',
          symbol_map = {
            Function = '󰊕',
          },
          before = function(entry, vim_item)
            if entry.source.name == 'nvim_lsp' then
              local lspserver_name = entry.source.source.client.name
              vim_item.menu = ('[%s]'):format(lspserver_name)
            end
            return vim_item
          end
        },
      },
    }
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'cmdline' }
      },
    })
  end,
}
