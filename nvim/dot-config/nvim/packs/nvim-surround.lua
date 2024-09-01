-- fancy macros to wrap text in brackets/quotes/everything that i forgot how to use
return {
  'kylechui/nvim-surround',
  config = function()
    require('nvim-surround').setup {}
  end,
}
