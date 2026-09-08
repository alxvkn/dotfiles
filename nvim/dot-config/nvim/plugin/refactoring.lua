-- lazy load?
vim.pack.add {
  'https://github.com/lewis6991/async.nvim',
  'https://github.com/ThePrimeagen/refactoring.nvim',
}
local refactoring = require('refactoring')
refactoring.setup()

local opts = { expr = true }

local modes = { 'n', 'x' }
vim.keymap.set(modes, '<Leader>riv', refactoring.inline_var, opts)
vim.keymap.set(modes, '<Leader>rev', refactoring.extract_var, opts)
vim.keymap.set(modes, '<Leader>rif', refactoring.inline_func, opts)
vim.keymap.set(modes, '<Leader>ref', refactoring.extract_func, opts)

vim.keymap.set('n', '<Leader>reff', function() return refactoring.extract_func() .. '_' end, opts)

vim.keymap.set('x', '<Leader>rpv', require('refactoring.debug').print_var, opts)
vim.keymap.set('n', '<Leader>rpv', function() return require('refactoring.debug').print_var() .. 'iw' end, opts)

vim.keymap.set(modes, '<Leader>rpe', require('refactoring.debug').print_exp, opts)
vim.keymap.set('n', '<Leader>rpee', function() return require('refactoring.debug').print_exp() .. '_' end, opts)

vim.keymap.set(modes, '<Leader>rpc', require('refactoring.debug').cleanup, opts)
