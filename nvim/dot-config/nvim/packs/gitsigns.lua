---@type LazySpec
return {
  'lewis6991/gitsigns.nvim',
  config = function()
    local gitsigns = require('gitsigns')
    vim.keymap.set('n', '[g', function() gitsigns.nav_hunk('prev') end)
    vim.keymap.set('n', ']g', function() gitsigns.nav_hunk('next') end)
    vim.keymap.set('n', '<Leader>gp', gitsigns.preview_hunk)
    vim.keymap.set('n', '<Leader>gs', gitsigns.stage_hunk)
    vim.keymap.set('n', '<Leader>ga', gitsigns.stage_buffer)
    vim.keymap.set('n', '<Leader>gR', gitsigns.reset_buffer)
    gitsigns.setup {
      signcolumn = true,
    }
  end,
}
