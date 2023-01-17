local use = require('packer').use

use 'wbthomason/packer.nvim'

-- lua utility functions required by various plugins
use {
  'nvim-lua/plenary.nvim',
  module = 'plenary',
}

-- kind of a default options superset for (neo)vim
use 'tpope/vim-sensible'

-- i would say, make netrw actually usable
use 'tpope/vim-vinegar'

-- auto-pairs for brackets/quotes
-- use 'jiangmiao/auto-pairs'

-- fancy macros to wrap text in brackets/quotes/everything that i forgot how to use
use 'tpope/vim-surround'
-- properly repeat surround mappings with .
use 'tpope/vim-repeat'

-- commenting plugin
use {
  'numtostr/comment.nvim',
  config = function()
    require('Comment').setup {}
  end,
}

-- pywal integration
use {
  'AlphaTechnolog/pywal.nvim',
}

-- git integration
use {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<Leader>gg', ':Git<cr>', {})
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signcolumn = false,
        numhl = true,
      }
    end,
    event = 'BufRead',
  },
}
use {
  'TimUntersberger/neogit',
  requires = 'nvim-lua/plenary.nvim',
}

-- nvim-treesitter
use {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
  event = 'BufRead',
}

-- snippets
use {
  'L3MON4D3/LuaSnip', -- engine
  config = function()
    require('luasnip').setup {}
    require('luasnip.loaders.from_vscode').lazy_load()
  end,
}
use 'rafamadriz/friendly-snippets' -- snippets themself

-- ui for displaying lsp loading progress
use {
  'j-hui/fidget.nvim',
  config = function()
    require('fidget').setup {
      text = {
        spinner = 'line',
      },
    }
  end,
}

-- highlight and list todo/note/fix etc. comments
use {
  'folke/todo-comments.nvim',
  config = function()
    require('todo-comments').setup {}
  end,
}

use {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup {}
  end,
}

use {
  'abecodes/tabout.nvim',
  after = 'nvim-treesitter',
  config = function()
    require('tabout').setup {}
  end,
}
