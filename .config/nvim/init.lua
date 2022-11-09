local packer_just_installed = nil

-- installing packer.nvim if it isn't already installed
local packer_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) ~= 0 then
  print('cloning packer.nvim with git into ' .. packer_path)
  vim.fn.system { 'git', 'clone', '--depth=1', 'https://github.com/wbthomason/packer.nvim', packer_path }
  if vim.v.shell_error == 0 then
    print 'successfully installed packer.nvim'
    packer_just_installed = true
  else
    print 'something went wrong. check if git is available in $PATH'
    return
  end
end

require 'config.plugins'

-- if packer.nvim was installed at this exact config run:
-- - run packer.sync() to install all specified plugins;
-- - setup autocmd to notify user when packer.sync() is completed;
-- - stop execution of this config;
if packer_just_installed then
  require('packer').sync()
  vim.cmd [[autocmd! User PackerComplete echo 'looks like packer.sync() completed. either re-source init.lua or restart nvim']]
  -- life would be easier if there was a way to make packer.sync() blocking
  return -- prevent further config execution, since plugins are not yet installed
end

-- enable mouse in all modes
vim.o.mouse = 'a'

-- at moment i thought i understood how indentation settings work
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.autoindent = true

-- Fix for some mystery happening to # symbol
-- vim.o.smartindent = false
-- vim.o.cindent = true
-- vim.opt.cinkeys:remove'0#'
-- vim.opt.indentkeys:remove'0#'

-- no swapfiles
vim.o.swapfile = false
vim.o.number = true

-- only ignore case in command completion
vim.cmd [[
    augroup ignorecase_commandmode
        autocmd!
        autocmd CmdLineEnter : let &ignorecase = 1
        autocmd CmdLineLeave : let &ignorecase = 0
    augroup end
]]

-- Russian keys
vim.o.langmap =
  'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'

vim.g.mapleader = ' '

vim.o.timeout = false

vim.o.completeopt = 'menuone,noselect'

require 'config.mappings'

-- Appearance
vim.o.termguicolors = true
require('pywal').setup()
vim.o.guifont = 'Fira Code:h10'

vim.o.title = true
