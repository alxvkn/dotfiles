-- fancy macros to wrap text in brackets/quotes/everything that i forgot how to use
require('packer').use {
  'kylechui/nvim-surround',
  config = function()
    require('nvim-surround').setup {}
  end,
}
