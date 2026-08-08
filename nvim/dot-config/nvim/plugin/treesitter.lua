vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter' }
vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' }

local bind = require('util').bind

local function setup_tto_move()
  local tto_move = require 'nvim-treesitter-textobjects.move'

  local mode = { 'n', 'o', 'x' }

  vim.keymap.set(mode, ']f', bind(tto_move.goto_next_start, '@function.outer'))
  vim.keymap.set(mode, '[f', bind(tto_move.goto_previous_start, '@function.outer'))

  vim.keymap.set(mode, ']F', bind(tto_move.goto_next_end, '@function.outer'))
  vim.keymap.set(mode, '[F', bind(tto_move.goto_previous_end, '@function.outer'))

  vim.keymap.set(mode, ']c', bind(tto_move.goto_next_start, '@class.outer'))
  vim.keymap.set(mode, '[c', bind(tto_move.goto_previous_start, '@class.outer'))

  vim.keymap.set(mode, ']C', bind(tto_move.goto_next_end, '@class.outer'))
  vim.keymap.set(mode, '[C', bind(tto_move.goto_previous_end, '@class.outer'))

  vim.keymap.set(mode, ']a', bind(tto_move.goto_next_start, '@parameter.inner'))
  vim.keymap.set(mode, '[a', bind(tto_move.goto_previous_start, '@parameter.inner'))

  vim.keymap.set(mode, ']=', bind(tto_move.goto_next_start, '@assignment.outer'))
  vim.keymap.set(mode, '[=', bind(tto_move.goto_previous_start, '@assignment.outer'))

  vim.keymap.set(mode, ']L', bind(tto_move.goto_next_start, '@loop.outer'))
  vim.keymap.set(mode, '[L', bind(tto_move.goto_previous_start, '@loop.outer'))
end

local function setup_tto_select()
  require('nvim-treesitter-textobjects').setup {
    select = {
      lookahead = true,
    }
  }
  local select_mappings = {
    ['af'] = '@function.outer',
    ['if'] = '@function.inner',
    ['ac'] = '@class.outer',
    ['ic'] = '@class.inner',
    ['al'] = '@loop.outer',
    ['il'] = '@loop.inner',

    ['a='] = '@assignment.outer',
    ['i='] = '@assignment.inner',
    ['ik'] = '@assignment.lhs',
    ['iv'] = '@assignment.rhs',

    ['a/'] = '@comment.outer',
    ['i/'] = '@comment.outer',

    ['ai'] = '@block.outer',
    ['ii'] = '@block.inner',

    ['aa'] = '@parameter.outer',
    ['ia'] = '@parameter.inner',

    ['aC'] = '@call.outer',
    ['iC'] = '@call.inner',
  }

  local tto_select = require('nvim-treesitter-textobjects.select')
  local mode = { 'x', 'o' }

  for lhs, capture_name in pairs(select_mappings) do
    vim.keymap.set(mode, lhs, bind(tto_select.select_textobject, capture_name))
  end
end

-- auto-start treesitter if a parser for current language is installed
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('my.ts_autostart', {}),
  callback = function(args)
    if require('util').table_has_value(
          require('nvim-treesitter').get_installed(),
          vim.treesitter.language.get_lang(args.match)
        ) then
      vim.treesitter.start()
      vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo[0][0].foldmethod = 'expr'

      setup_tto_select()
      setup_tto_move()

      local tto_swap = require('nvim-treesitter-textobjects.swap')
      vim.keymap.set('n', '<Leader>t', bind(tto_swap.swap_next, '@parameter.inner'))
      vim.keymap.set('n', '<Leader>T', bind(tto_swap.swap_previous, '@parameter.inner'))
    end
  end
})
