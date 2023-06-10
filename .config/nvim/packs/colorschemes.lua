return {
  'RRethy/nvim-base16',
  'dikiaap/minimalist',
  'srcery-colors/srcery-vim',
  'nanotech/jellybeans.vim',
  'ntk148v/vim-horizon',
  'rose-pine/neovim',
  'ayu-theme/ayu-vim',
  'kdheepak/monochrome.nvim',
  'projekt0n/github-nvim-theme',
  {
    'EdenEast/nightfox.nvim',
    config = function()
      print('nightfox\'s config function start')
      require 'colors'
      require('nightfox').setup {
        options = {
          dim_inactive = true,
          -- transparent = true
        }
      }
      vim.cmd.colorscheme 'rose-pine'
    end
  },
}
