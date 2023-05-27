-- git integration
require('packer').use {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<Leader>gg', ':Git<cr>', {})
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signcolumn = false,
        numhl = true,
      }
    end,
  },
}
