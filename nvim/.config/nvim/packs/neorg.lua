return {
  'nvim-neorg/neorg',
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
              notes = '~/documents/neorg/notes'
            }
          }
        }
      },
    }
    vim.keymap.set('n', '<Leader>n', vim.cmd['Neorg'])
  end,
}
