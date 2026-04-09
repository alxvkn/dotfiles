vim.pack.add { 'https://github.com/lewis6991/gitsigns.nvim' }

local gs = require('gitsigns')

gs.setup()

vim.keymap.set('n', ']g', function() gs.nav_hunk('next') end)
vim.keymap.set('n', '[g', function() gs.nav_hunk('prev') end)

vim.keymap.set('n', ']G', function() gs.nav_hunk('last') end)
vim.keymap.set('n', '[G', function() gs.nav_hunk('first') end)
