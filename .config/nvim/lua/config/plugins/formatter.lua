require('formatter').setup {
  filetype = {
    lua = {
      function()
        return {
          exe = 'stylua',
          args = {
            '--search-parent-directories',
            '-',
          },
          stdin = true,
        }
      end,
    },
  },
}

