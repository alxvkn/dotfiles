vim.pack.add { 'https://github.com/stevearc/oil.nvim' }

local oil = require('oil')

oil.setup {
  -- win_options = {
  --   signcolumn = 'yes',
  -- },
  columns = {
    'icon',
    'size',
  },
  skip_confirm_for_simple_edits = true
}

vim.keymap.set('n', '-', oil.open, {})
