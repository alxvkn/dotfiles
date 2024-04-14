return {
  'lewis6991/gitsigns.nvim',
  config = function()
    local gitsigns = require('gitsigns')
    vim.keymap.set('n', '[g', gitsigns.prev_hunk)
    vim.keymap.set('n', ']g', gitsigns.next_hunk)
    vim.keymap.set('n', '<Leader>gp', gitsigns.preview_hunk)
    vim.keymap.set('n', '<Leader>gs', gitsigns.stage_hunk)
    vim.keymap.set('n', '<Leader>gu', gitsigns.undo_stage_hunk)
    vim.keymap.set('n', '<Leader>ga', gitsigns.stage_buffer)
    vim.keymap.set('n', '<Leader>gr', gitsigns.reset_buffer)
    gitsigns.setup {
      signcolumn = true,
    }
  end,
}
