require('packer').use {
  'stevearc/dressing.nvim',
  config = function()
    require('dressing').setup ()
  end
}
