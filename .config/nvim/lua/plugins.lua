local packer = require'packer'
packer.reset()
packer.init({compile_path = vim.fn.stdpath('data') .. '/site/plugin/packer_compiled.lua'})
packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-sensible'

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use 'junegunn/fzf'
    use 'tpope/vim-vinegar'
    use 'tpope/vim-fugitive'

    use 'jiangmiao/auto-pairs'
    use 'tpope/vim-surround'

    use 'numtostr/comment.nvim'

    -- colorschemes
    use 'dikiaap/minimalist'
    use 'srcery-colors/srcery-vim'
    use 'nanotech/jellybeans.vim'
    use 'ntk148v/vim-horizon'
    use 'ayu-theme/ayu-vim'

    -- nvim-cmp
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp' -- nvim lsp completion source
    use 'dcampos/cmp-snippy' -- snippy completion source

    -- snippets
    use 'dcampos/nvim-snippy' -- engine
    use 'honza/vim-snippets' -- snippets themself

    -- predefined configurations for various langauge servers
    use 'neovim/nvim-lspconfig'
end)
