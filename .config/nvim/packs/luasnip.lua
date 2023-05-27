-- snippets
require('packer').use {
  'L3MON4D3/LuaSnip', -- engine
  config = function()
    require('luasnip').setup {}
    require('luasnip.loaders.from_vscode').lazy_load {
      exclude = { 'html', 'css' }
    }
  end,
}
