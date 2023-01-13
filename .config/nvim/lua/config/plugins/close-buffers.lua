require('close_buffers').setup {}

-- BDelete
vim.keymap.set('n', '<C-B>dh', function() require('close_buffers').delete { type = 'hidden' } end)
vim.keymap.set('n', '<C-B>do', function() require('close_buffers').delete { type = 'other' } end)
vim.keymap.set('n', '<C-B>da', function() require('close_buffers').delete { type = 'all' } end)
vim.keymap.set('n', '<C-B>dd', function() require('close_buffers').delete { type = 'this' } end)

-- BWipeout
vim.keymap.set('n', '<C-B>wh', function() require('close_buffers').wipe { type = 'hidden' } end)
vim.keymap.set('n', '<C-B>wo', function() require('close_buffers').wipe { type = 'other' } end)
vim.keymap.set('n', '<C-B>wa', function() require('close_buffers').wipe { type = 'all' } end)
vim.keymap.set('n', '<C-B>ww', function() require('close_buffers').wipe { type = 'this' } end)
