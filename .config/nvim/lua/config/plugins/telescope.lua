vim.keymap.set('n', '<Leader>t<Leader>', function() require('telescope.builtin').builtin() end)
vim.keymap.set('n', '<Leader>tf', function() require('telescope.builtin').find_files() end)
vim.keymap.set('n', '<Leader>tg', function() require('telescope.builtin').git_files() end)
vim.keymap.set('n', '<Leader>tb', function() require('telescope.builtin').buffers() end)
vim.keymap.set('n', '<Leader>th', function() require('telescope.builtin').help_tags() end)
vim.keymap.set('n', '<Leader>tj', function() require('telescope.builtin').planets() end)

vim.keymap.set('n', '<Leader>tc', function() require('telescope.builtin').colorscheme { enable_preview = true } end)
