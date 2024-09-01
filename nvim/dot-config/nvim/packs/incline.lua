return {
  'b0o/incline.nvim',
  config = function()
    require('incline').setup {
      window = {
        margin = {
          vertical = 0,
        },
      },
    }
  end,
}
