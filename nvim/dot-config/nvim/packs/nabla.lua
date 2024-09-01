return {
  'jbyuki/nabla.nvim',
  keys = '<Leader>$',
  config = function()
    vim.keymap.set('n', '<Leader>$', require('nabla').popup)
  end
}
