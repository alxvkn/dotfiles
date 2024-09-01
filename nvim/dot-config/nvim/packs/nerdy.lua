return {
  '2KAbhishek/nerdy.nvim',
  keys = '<Leader>.',
  config = function()
    vim.keymap.set('n', '<Leader>.', require('nerdy').list)
  end
}
