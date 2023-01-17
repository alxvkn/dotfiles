require('packer').use {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {}
    vim.keymap.set('n', '-', require('oil').open, {})
  end
}
