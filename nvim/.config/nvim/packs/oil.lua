return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {
      win_options = {
        signcolumn = "yes"
      },
      keymaps = {
        ['H'] = 'actions.parent',
        ['L'] = 'actions.select'
      }
    }
    vim.keymap.set('n', '-', require('oil').open, {})
  end
}
