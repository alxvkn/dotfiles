-- highlight and list todo/note/fix etc. comments
require('packer').use {
  'folke/todo-comments.nvim',
  config = function()
    require('todo-comments').setup {}
  end,
}
