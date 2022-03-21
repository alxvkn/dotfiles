local packer = require 'packer'
packer.reset()
packer.init {
  compile_path = vim.fn.stdpath 'data' .. '/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'single' }
    end,
  },
}
packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- lua utility functions required by various plugins
  use {
    'nvim-lua/plenary.nvim',
    module = 'plenary',
  }

  -- kind of a default options superset for (neo)vim
  use 'tpope/vim-sensible'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require 'config.plugins.lualine'
    end,
  }

  -- i would say, make netrw actually usable
  use 'tpope/vim-vinegar'

  -- auto-pairs for brackets/quotes
  use 'jiangmiao/auto-pairs'

  -- fancy macros to wrap text in brackets/quotes/everything that i forgot how to use
  use 'tpope/vim-surround'

  -- commenting plugin
  use {
    'numtostr/comment.nvim',
    config = function()
      require 'config.plugins.Comment'
    end,
  }

  -- colorschemes
  use {
    'chriskempson/base16-vim',
    'dikiaap/minimalist',
    'srcery-colors/srcery-vim',
    'nanotech/jellybeans.vim',
    'ntk148v/vim-horizon',
    'ayu-theme/ayu-vim',
    'kdheepak/monochrome.nvim',
    'projekt0n/github-nvim-theme',
  }

  -- git integration
  use {
    'tpope/vim-fugitive',
    {
      'lewis6991/gitsigns.nvim',
      config = function()
        require 'config.plugins.gitsigns'
      end,
      event = 'BufRead',
    },
  }

  -- nvim-cmp
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp', -- nvim lsp completion source
      'dcampos/cmp-snippy', -- snippy completion source
    },
    config = function()
      require 'config.plugins.cmp'
    end,
  }
  -- nvim-treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require 'config.plugins.treesitter'
    end,
    event = 'BufRead',
  }

  -- snippets
  use {
    'dcampos/nvim-snippy', -- engine
    config = function()
      require 'config.plugins.snippy'
    end,
  }
  use 'honza/vim-snippets' -- snippets themself

  -- predefined configurations for various langauge servers
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require 'config.plugins.lsp.lspconfig'
    end,
  }

  -- sumneko lua configuration for nvim plugins/config files
  use {
    'folke/lua-dev.nvim',
    config = function()
      require 'config.plugins.lsp.nvim-lua-dev'
    end,
    ft = 'lua',
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require 'config.plugins.telescope'
    end,
  }

  -- formatter
  use {
    'mhartington/formatter.nvim',
    config = function()
      require 'config.plugins.formatter'
    end,
    cmd = {
      'Format',
      'FormatWrite',
    },
  }

  -- buffer deletion utility
  use {
    'kazhala/close-buffers.nvim',
    config = function()
      require 'config.plugins.close-buffers'
    end,
  }

  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require 'config.plugins.toggleterm'
    end,
  }

  -- ui for displaying lsp loading progress
  use {
    'j-hui/fidget.nvim',
    config = function()
      require 'config.plugins.fidget'
    end,
  }

  -- highlight and list todo/note/fix etc. comments
  use {
    'folke/todo-comments.nvim',
    config = function()
      require 'config.plugins.todo-comments'
    end,
  }
end)
