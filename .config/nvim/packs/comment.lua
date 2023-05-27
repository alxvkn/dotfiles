-- commenting plugin
require('packer').use {
  'numtostr/comment.nvim',
  config = function()
    require('Comment').setup {}
  end,
}
