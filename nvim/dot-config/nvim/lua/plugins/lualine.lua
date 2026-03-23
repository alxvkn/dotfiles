---@type LazySpec
return {
  'nvim-lualine/lualine.nvim',
  config = function()
    vim.o.laststatus = 3
    require('lualine').setup {
      extensions = {
        'toggleterm',
        'fugitive',
      },
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          'branch',
          'diff',
          {
            'diagnostics',
            sources = {
              function()
                -- nil as bufnr returns diagnostics count for all buffers
                local counts = vim.diagnostic.count(nil, {})

                local s = vim.diagnostic.severity

                return {
                  error = counts[s.ERROR],
                  warn = counts[s.WARN],
                  info = counts[s.INFO],
                  hint = counts[s.HINT],
                }
              end
            }
          }
        },
        lualine_c = {
          'filename',
          '%=',
          {
            'lsp_status',
            icon = ''
          }
        },
        lualine_x = {
          'encoding',
          'fileformat',
          'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
