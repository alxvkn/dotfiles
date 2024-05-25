require 'transparency'
return {
  'RRethy/nvim-base16',
  'dikiaap/minimalist',
  'ntk148v/vim-horizon',
  'ayu-theme/ayu-vim',
  'kdheepak/monochrome.nvim',
  'projekt0n/github-nvim-theme',
  'ellisonleao/gruvbox.nvim',
  {
    'Mofiqul/vscode.nvim',
    config = function()
      require('vscode').setup {}
      vim.cmd.colorscheme 'vscode'
    end
  },
  'rose-pine/neovim',
  {
    'EdenEast/nightfox.nvim',
    lazy = true,
    config = function()
      require('nightfox').setup {
        options = {
          dim_inactive = true,
          transparent = true
        }
      }
    end
  },
}
