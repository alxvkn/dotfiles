-- auto complete language-specific constructions
-- like if then/end, function()/end in lua
require('packer').use {
  'RRethy/nvim-treesitter-endwise',
  after = 'nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup {
      endwise = {
        enable = true
      }
    }
  end
}
