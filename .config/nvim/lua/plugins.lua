local packer = require'packer'
packer.init({compile_path = vim.fn.stdpath('data') .. '/site/plugin/packer_compiled.lua'})
packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'savq/paq-nvim'

    use 'tpope/vim-sensible'
    use 'tpope/vim-vinegar'
    use 'tpope/vim-fugitive'

    use 'junegunn/fzf'

    use 'vim-airline/vim-airline'

    use 'preservim/nerdcommenter'
    use 'jiangmiao/auto-pairs'
    use 'tpope/vim-surround'

    use {'neoclide/coc.nvim', branch = 'release', opt = true}

    -- colorschemes
    use 'dikiaap/minimalist'
    use 'srcery-colors/srcery-vim'
end)
