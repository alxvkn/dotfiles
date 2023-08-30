-- git integration
return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<Leader>gg', ':Git<cr>', {})
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local gitsigns = require('gitsigns')
      vim.keymap.set('n', '[g', gitsigns.prev_hunk)
      vim.keymap.set('n', ']g', gitsigns.next_hunk)
      gitsigns.setup {
        signcolumn = false,
        numhl = true,
      }
    end,
  },
}
