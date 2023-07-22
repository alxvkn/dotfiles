-- highlight and list todo/note/fix etc. comments
return {
  'folke/todo-comments.nvim',
  config = function()
    require('todo-comments').setup {}
  end,
}
