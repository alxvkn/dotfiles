require('packer').use {
  'RRethy/nvim-base16',
  'dikiaap/minimalist',
  'srcery-colors/srcery-vim',
  'nanotech/jellybeans.vim',
  'ntk148v/vim-horizon',
  'ayu-theme/ayu-vim',
  'kdheepak/monochrome.nvim',
  'projekt0n/github-nvim-theme',
  {
    'EdenEast/nightfox.nvim',
    config = function()
      print('nightfox\'s config function start')
      require('nightfox').setup {
        options = {
          dim_inactive = true,
          transparent = true
        }
      }
      vim.cmd.colorscheme 'nightfox'
    end
  },
}
