---@type LazySpec
return {
  'folke/twilight.nvim',
  config = function()
    local twilight = require('twilight')
    twilight.setup()
    vim.keymap.set('n', '<Leader>t', twilight.toggle)
  end,
}
