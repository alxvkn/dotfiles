vim.pack.add { 'https://github.com/folke/zen-mode.nvim' }

local zen = require('zen-mode')
zen.setup {}

vim.keymap.set('n', '<Leader>z', zen.toggle)
