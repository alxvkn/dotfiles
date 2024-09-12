-- commenting plugin
return {
  'numtostr/comment.nvim',
  config = function()
    require('Comment').setup {
      toggler = {
        line = '<Leader>//',
        block = '<Leader>/?',
      },
      opleader = {
        line = '<Leader>/',
        block = '<Leader>?',
      },
      mappings = {
        extra = false,
      },
    }
  end,
}
