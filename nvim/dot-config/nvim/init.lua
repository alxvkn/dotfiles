local util = require "util"
-- vim.loader.enable()

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.o.number = true
vim.o.relativenumber = true

vim.o.list = true

vim.o.foldlevelstart = 99

vim.g.mapleader = ' '

vim.keymap.set('n', '<BS>', '<C-^>', {})

vim.api.nvim_create_user_command('PackDelInactive', util.pack_del_inactive, {})
