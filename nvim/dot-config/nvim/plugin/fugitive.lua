vim.pack.add { 'https://github.com/tpope/vim-fugitive' }

require('config_test').add(function()
  vim.cmd 'G --version'
end)
