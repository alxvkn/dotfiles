return {
  'RRethy/nvim-base16',
  'kdheepak/monochrome.nvim',
  'ellisonleao/gruvbox.nvim',
  -- 'ayu-theme/ayu-vim',
  -- 'projekt0n/github-nvim-theme',
  -- 'ramojus/mellifluous.nvim',
  {
    'Mofiqul/vscode.nvim',
    lazy = true,
    config = function()
      require('vscode').setup {}
    end
  },
  'rose-pine/neovim',
  'vague2k/vague.nvim',
  'rjshkhr/shadow.nvim',
  -- {
  --   'EdenEast/nightfox.nvim',
  --   lazy = true,
  --   config = function()
  --     require('nightfox').setup {
  --       options = {
  --         dim_inactive = true,
  --         transparent = false
  --       }
  --     }
  --   end
  -- },
}
