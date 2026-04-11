-- vim.pack.add({ 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' })
--
-- vim.api.nvim_create_autocmd('PackChanged', {
--   group = vim.api.nvim_create_augroup('my.build_fzf_native', {}),
--   callback = function(e)
--     local name, kind = e.data.spec.name, e.data.kind
--
--     if name == 'telescope-fzf-native.nvim' and (kind == 'install' or kind == 'update') then
--       local obj = vim.system({ 'make' }, { cwd = e.data.path }):wait()
--       print(obj)
--     end
--   end
-- })

vim.pack.add({ 'https://github.com/nvim-telescope/telescope.nvim' })

-- require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader><leader>', builtin.builtin)

vim.keymap.set('n', '<leader>r', builtin.live_grep, { desc = 'Find live g[r]ep results' })
vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Find [h]elp' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Find [b]uffers' })
vim.keymap.set('n', '<leader>f', builtin.git_files, { desc = 'Find [g]it-tracked files' })
vim.keymap.set('n', '<leader>F', builtin.find_files, { desc = 'Find all [F]iles' })
