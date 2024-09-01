return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<Leader>gg', ':Git<cr>', {})
  end,
}
