local packer = require'packer'
packer.reset()
packer.init({compile_path = vim.fn.stdpath('data') .. '/site/plugin/packer_compiled.lua'})
packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-sensible'
    use 'tpope/vim-vinegar'
    use 'tpope/vim-fugitive'

    use 'junegunn/fzf'

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use 'jiangmiao/auto-pairs'
    use 'tpope/vim-surround'

    use 'numtostr/comment.nvim'

    use {'neoclide/coc.nvim', branch = 'release', opt = true}

    -- colorschemes
    use 'dikiaap/minimalist'
    use 'srcery-colors/srcery-vim'
    use 'nanotech/jellybeans.vim'
    use 'ntk148v/vim-horizon'
    use 'ayu-theme/ayu-vim'
end)
