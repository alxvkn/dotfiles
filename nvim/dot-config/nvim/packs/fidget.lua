---@type LazySpec
-- ui for displaying lsp loading progress
return {
  'j-hui/fidget.nvim',
  branch = 'legacy',
  config = function()
    require('fidget').setup {
      text = {
        spinner = 'line',
      },
    }
  end,
}
