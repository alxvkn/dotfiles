-- vim.loader.enable()

vim.o.expandtab = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.list = true

vim.o.foldlevelstart = 99

vim.pack.add { 'https://github.com/rose-pine/neovim' }
vim.cmd.colorscheme 'rose-pine'
