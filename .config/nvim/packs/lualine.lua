require('packer').use {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      extensions = {
        'toggleterm',
        'fugitive',
      },
      options = {
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = {
          'encoding',
          'fileformat',
          {
            'filetype',
            icon_only = true,
          },
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
