---@type LazySpec
return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    config = function()
      require('nvim-treesitter-textobjects').setup {
        select = {
          lookahead = true,
        },
      }

      local select_keymaps = {
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',

        ['af'] = '@function.outer',
        ['if'] = '@function.inner',

        ['aC'] = '@call.outer',
        ['iC'] = '@call.inner',

        ['al'] = '@loop.outer',
        ['il'] = '@loop.inner',

        ['a='] = '@assignment.outer',
        ['i='] = '@assignment.inner',
        ['ik'] = '@assignment.lhs',
        ['iv'] = '@assignment.rhs',

        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      }

      local tto_select = require 'nvim-treesitter-textobjects.select'
      for k, v in pairs(select_keymaps) do
        vim.keymap.set(
          { 'x', 'o' },
          k,
          function()
            tto_select.select_textobject(v)
          end
        )
      end

      local tto_swap = require 'nvim-treesitter-textobjects.swap'
      vim.keymap.set('n', '<Leader>a', function()
        tto_swap.swap_next '@parameter.inner'
      end)
      vim.keymap.set('n', '<Leader>A', function()
        tto_swap.swap_previous '@parameter.inner'
      end)

      local tto_move = require 'nvim-treesitter-textobjects.move'
      local mode = { 'n', 'x', 'o' }
      vim.keymap.set(mode, ']f', function()
        tto_move.goto_next_start('@function.outer')
      end)
      vim.keymap.set(mode, ']c', function()
        tto_move.goto_next_start('@class.outer')
      end)

      vim.keymap.set(mode, '[f', function()
        tto_move.goto_previous_start('@function.outer')
      end)
      vim.keymap.set(mode, '[c', function()
        tto_move.goto_previous_start('@class.outer')
      end)

      vim.keymap.set(mode, ']F', function()
        tto_move.goto_next_end('@function.outer')
      end)
      vim.keymap.set(mode, ']C', function()
        tto_move.goto_next_end('@class.outer')
      end)

      vim.keymap.set(mode, '[F', function()
        tto_move.goto_previous_end('@function.outer')
      end)
      vim.keymap.set(mode, '[C', function()
        tto_move.goto_previous_end('@class.outer')
      end)
    end
  },
}
