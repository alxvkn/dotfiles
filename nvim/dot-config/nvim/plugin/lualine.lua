vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim' }

require('lualine').setup {
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      },
      '%=',
      'lsp_status'
    },
    lualine_y = {},
    lualine_z = {
      function ()
        return ('(%d/%d):(%d/%d)'):format(
          vim.fn.line('.'), vim.fn.line('$'),
          vim.fn.virtcol('.'), vim.fn.strchars(vim.fn.getline('.')))
      end,
    },
  },
  options = {
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  }
}
