require('packer').use {
  {
    -- pywal integration
    'AlphaTechnolog/pywal.nvim',
    config = function()
      local f = io.open(os.getenv('HOME') .. '/.cache/wal/colors-wal.vim', 'r')
      if f ~= nil then
        f:close()
        local ok, pywal = pcall(require, 'pywal')
        if ok then
          pywal.setup()
          -- so bg overrides will happen
          vim.cmd.doautocmd 'ColorScheme'
        end
      else
        local _, _ = pcall(
          require,
          'nightfox'-- just so the config is loaded
        )
      end
    end
  },
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
    module = 'nightfox',
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
