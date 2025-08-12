return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    config = function()
      require('nvim-treesitter.configs').setup {
        textobjects = {
          select = {
            enable = true,

            lookahead = true,
            keymaps = {
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
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },
          move = {
            enable = true,
            -- TODO: jumps to objects from select
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]c"] = "@class.outer",
            },
            goto_next_end = {
              ["]F"] = "@function.outer",
              ["]C"] = "@class.outer",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[c"] = "@class.outer",
            },
            goto_previous_end = {
              ["[F"] = "@function.outer",
              ["[C"] = "@class.outer",
            },
          },
        }
      }
    end
  },
  {
    'nvim-treesitter/playground',
    config = function()
      require('nvim-treesitter.configs').setup {
        playground = {
          enable = true
        }
      }
    end
  }
}
