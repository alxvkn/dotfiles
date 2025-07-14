return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-calc',
    'andersevenrud/cmp-tmux',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind.nvim',
  },
  config = function()
    local cmp = require 'cmp'
    local lspkind = require 'lspkind'
    local neotab = require 'neotab'

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
        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i' }),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i' }),
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i' }),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<Tab>'] = cmp.mapping(function(_)
          if cmp.visible() then
            cmp.select_next_item()
          else
            neotab.tabout_luasnip()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(_)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            neotab.tabout_luasnip()
          end
        end, { 'i', 's' }),
      },
      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'calc' },
        { name = 'tmux' },
      },
      formatting = {
        format = lspkind.cmp_format {
          mode = 'symbol_text',
          preset = 'codicons',
          symbol_map = {
            Function = '󰊕',
          },
          before = function(entry, vim_item)
            vim_item.menu = entry.source.name
            if entry.source.name == 'nvim_lsp' then
              local lspserver_name = entry.source.source.client.name
              vim_item.menu = vim_item.menu .. (('[%s]'):format(lspserver_name))
            elseif entry.source.name == 'calc' then
              vim_item.kind = '󰪚'
            end
            return vim_item
          end
        },
      },
      window = {
        completion = {
          winblend = 10,
        },
      }
    }
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'cmdline' }
      },
    })
  end,
}
