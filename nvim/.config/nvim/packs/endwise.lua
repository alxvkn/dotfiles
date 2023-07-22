-- auto complete language-specific constructions
-- like if then/end, function()/end in lua
return {
  'RRethy/nvim-treesitter-endwise',
  config = function()
    require('nvim-treesitter.configs').setup {
      endwise = {
        enable = true
      }
    }
  end
}
