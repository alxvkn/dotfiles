local packer = require 'packer'
packer.reset()
packer.init { compile_path = vim.fn.stdpath 'data' .. '/site/plugin/packer_compiled.lua' }
packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- lua utility functions required by various plugins
  use 'nvim-lua/plenary.nvim'

  -- kind of a default options superset for (neo)vim
  use 'tpope/vim-sensible'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  use 'tpope/vim-vinegar'

  use 'jiangmiao/auto-pairs'

  -- fancy macros to wrap text in brackets/quotes/everything that i forgot how to use
  use 'tpope/vim-surround'

  -- commenting plugin
  use 'numtostr/comment.nvim'

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
  }
  -- nvim-treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- snippets
  use 'dcampos/nvim-snippy' -- engine
  use 'honza/vim-snippets' -- snippets themself

  -- predefined configurations for various langauge servers
  use 'neovim/nvim-lspconfig'

  -- telescope
  use 'nvim-telescope/telescope.nvim'

  -- formatter
  use 'mhartington/formatter.nvim'
end)
