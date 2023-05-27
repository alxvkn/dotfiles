-- ui for displaying lsp loading progress
require('packer').use {
  'j-hui/fidget.nvim',
  config = function()
    require('fidget').setup {
      text = {
        spinner = 'line',
      },
    }
  end,
}
