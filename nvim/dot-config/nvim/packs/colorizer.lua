---@type LazySpec
-- preview colors
return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup {
      '*'
    }
  end,
}
