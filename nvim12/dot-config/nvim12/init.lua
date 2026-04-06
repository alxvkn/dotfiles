vim.o.number = true
vim.o.relativenumber = true

vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter' }

vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim' }
require('lualine').setup {
  options = {
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  }
}

vim.pack.add { 'https://github.com/rose-pine/neovim' }
vim.cmd.colorscheme 'rose-pine'
