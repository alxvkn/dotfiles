vim.pack.add { 'https://github.com/lewis6991/gitsigns.nvim' }

local gs = require('gitsigns')

gs.setup {
  on_attach = function(buf)
    local opts = { buf = buf }

    vim.keymap.set('n', ']g', function() gs.nav_hunk('next') end, opts)
    vim.keymap.set('n', '[g', function() gs.nav_hunk('prev') end, opts)

    vim.keymap.set('n', ']G', function() gs.nav_hunk('last') end, opts)
    vim.keymap.set('n', '[G', function() gs.nav_hunk('first') end, opts)

    vim.keymap.set('n', '<Leader>gp', function() gs.preview_hunk() end, opts)
    vim.keymap.set('n', '<Leader>gd', function() gs.diffthis() end, opts)

    vim.keymap.set('n', '<Leader>gb', function() gs.blame_line() end, opts)

    vim.keymap.set('n', '<Leader>ga', function() gs.stage_hunk() end, opts)
    vim.keymap.set('n', '<Leader>gu', function() gs.undo_stage_hunk() end, opts)

    vim.keymap.set({ 'x', 'o' }, 'ag', function() gs.select_hunk() end, opts)
    vim.keymap.set({ 'x', 'o' }, 'ig', function() gs.select_hunk() end, opts)
  end
}
