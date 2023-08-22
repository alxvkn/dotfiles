return {
  'RRethy/nvim-base16',
  'dikiaap/minimalist',
  'ntk148v/vim-horizon',
  'ayu-theme/ayu-vim',
  'kdheepak/monochrome.nvim',
  'projekt0n/github-nvim-theme',
  {
    'rose-pine/neovim',
    config = function()
      -- TODO: require this module somewhere else
      require 'colors'
      vim.cmd.colorscheme 'rose-pine'
    end
  },
  {
    'EdenEast/nightfox.nvim',
    lazy = true,
    config = function()
      require('nightfox').setup {
        options = {
          dim_inactive = true,
          -- transparent = true
        }
      }
    end
  },
}