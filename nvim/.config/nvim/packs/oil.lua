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
      },
      view_options = {
        show_hidden = true,
      },
      columns = {
        "icon",
        "size",
      },
    }
    vim.keymap.set('n', '-', require('oil').open, {})
  end
}
