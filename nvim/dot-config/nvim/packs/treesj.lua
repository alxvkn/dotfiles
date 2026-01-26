---@type LazySpec
return {
  'Wansmer/treesj',
  keys = '<Leader>m',
  config = function()
    require('treesj').setup {
      use_default_keymaps = false,
    }
    vim.keymap.set('n', '<Leader>m', '<Cmd>TSJToggle<cr>')
  end
}
