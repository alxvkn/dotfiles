return {
  'nvim-neorg/neorg',
  cmd = 'Neorg',
  keys = {
    '<Leader>n',
    '<Leader>N',
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
        ['core.dirman'] = {
          config = {
            default_workspace = 'notes',
            workspaces = {
              notes = '~/documents/neorg/notes',
              college = '~/documents/neorg/college'
            }
          }
        }
      },
    }
    vim.keymap.set('n', '<Leader>n', vim.cmd['Neorg'])
    vim.keymap.set('n', '<Leader>N', ':Neorg ')
  end,
}
