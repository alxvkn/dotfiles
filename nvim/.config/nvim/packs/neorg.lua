return {
  'nvim-neorg/neorg',
  cmd = 'Neorg',
  keys = {
    '<Leader>n',
    '<Leader>N',
    '<Leader><Leader>w',
  },
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
        ['core.keybinds'] = {
          config = {
            default_keybinds = true,
            neorg_leader = '<Leader><Leader>',
          }
        },
        ['core.concealer'] = {},
        ['core.completion'] = {
          config = { engine = 'nvim-cmp' },
        },
        ['core.export'] = {},
        ['core.dirman'] = {
          config = {
            default_workspace = 'notes',
            workspaces = {
              notes = '~/documents/neorg/notes',
              college = '~/documents/college/neorg'
            }
          }
        }
      },
    }
    vim.keymap.set('n', '<Leader>n', vim.cmd['Neorg'])
    vim.keymap.set('n', '<Leader>N', ':Neorg ')
    vim.keymap.set('n', '<Leader><Leader>wc', '<cmd>Neorg workspace college<cr>')
    vim.keymap.set('n', '<Leader><Leader>wn', '<cmd>Neorg workspace notes<cr>')
  end,
}
