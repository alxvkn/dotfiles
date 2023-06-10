-- ui for displaying lsp loading progress
return {
  'j-hui/fidget.nvim',
  config = function()
    require('fidget').setup {
      text = {
        spinner = 'line',
      },
    }
  end,
}
