return {
  'L3MON4D3/LuaSnip', -- engine
  dependencies = { 'rafamadriz/friendly-snippets' },
  config = function()
    local luasnip = require('luasnip')

    vim.keymap.set('i', '<C-s>', function() luasnip.expand {} end)

    luasnip.setup {}
    require('luasnip.loaders.from_vscode').lazy_load {
      -- exclude = { 'html', 'css' }
    }

    for ft, snippets in pairs(require('snippets')) do
      -- custom snippets should have higher priority than the default one of 1000
      luasnip.add_snippets(ft, snippets, { priority = 10000 })
    end
  end,
}
