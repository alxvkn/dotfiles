---@type LazySpec
return {
  'L3MON4D3/LuaSnip', -- engine
  dependencies = { 'rafamadriz/friendly-snippets' },
  config = function()
    local luasnip = require('luasnip')
    local types = require 'luasnip.util.types'

    luasnip.setup {
      region_check_events = {
        'CursorMoved',
        'CursorHold',
        'InsertEnter'
      },
      delete_check_events = {
        'TextChanged'
      },
      ext_opts = {
        [types.insertNode] = {
          passive = {
            hl_group = 'Search',
            hl_mode = 'combine'
          },
        },
        [types.choiceNode] = {
          passive = {
            virt_text = { { '?', 'Comment' } },
            hl_group = 'Search',
            hl_mode = 'combine'
          },
        },
      }
    }

    vim.keymap.set({ 'i', 's' }, '<C-j>', function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end)
    vim.keymap.set({ 'i', 's' }, '<C-k>', function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end)

    require('luasnip.loaders.from_vscode').lazy_load {
      -- exclude = { 'html', 'css' }
    }

    for ft, snippets in pairs(require('snippets')) do
      -- custom snippets should have higher priority than the default one of 1000
      luasnip.add_snippets(ft, snippets, { priority = 10000 })
    end
  end,
}
