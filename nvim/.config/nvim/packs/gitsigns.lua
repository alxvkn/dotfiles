return {
  'lewis6991/gitsigns.nvim',
  config = function()
    local gitsigns = require('gitsigns')
    vim.keymap.set('n', '[g', gitsigns.prev_hunk)
    vim.keymap.set('n', ']g', gitsigns.next_hunk)
    vim.keymap.set('n', '<Leader>gp', gitsigns.preview_hunk)
    gitsigns.setup {
      signcolumn = true,
    }
  end,
}
