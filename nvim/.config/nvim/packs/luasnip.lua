-- snippets
return {
  'L3MON4D3/LuaSnip', -- engine
  dependencies = { 'rafamadriz/friendly-snippets' },
  config = function()
    vim.keymap.set('i', '<C-s>', require('luasnip').expand)
    require('luasnip').setup {}
    require('luasnip.loaders.from_vscode').lazy_load {
      exclude = { 'html', 'css' }
    }
  end,
}
