local packer_just_installed = nil

local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) ~= 0 then
    print('cloning packer.nvim with git into ' .. packer_path)
    vim.fn.system({'git', 'clone', '--depth=1',
        'https://github.com/wbthomason/packer.nvim', packer_path})
    if vim.v.shell_error == 0 then
        print'successfully installed packer.nvim'
        packer_just_installed = true
    else
        print'something went wrong. check if git is available in $PATH'
        return
    end
end

require'plugins'

if packer_just_installed then
    print'running packer.sync(). after that the config will be sourced again'
    require'packer'.sync()
    vim.cmd[[autocmd User PackerComplete execute 'source' stdpath('config') .. '/init.lua']]
    -- life would be easier if there was a way to make packer.sync() blocking
    return -- prevent further config execution, since plugins are not yet installed
end


local function map(mode, lhs, rhs, opts)
    if opts then opts['noremap'] = true
    else opts = {noremap = true} end
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

vim.o.termguicolors = true

vim.o.mouse = 'a'

-- at moment i thought i understood how indentation settings work
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.autoindent = true

-- Fix for some mystery happening to # symbol
vim.o.smartindent = false
vim.o.cindent = true
vim.opt.cinkeys:remove'0#'
vim.opt.indentkeys:remove'0#'

vim.o.swapfile = false
vim.o.number = true


-- only ignore case in command completion
vim.cmd[[
    augroup ignorecase_commandmode
        autocmd!
        autocmd CmdLineEnter : let &ignorecase = 1
        autocmd CmdLineLeave : let &ignorecase = 0
    augroup end
]]

-- :e # by ctrl+j
map('n', '<C-J>', '<C-^>', {})

-- Russian keys
vim.o.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'

-- NERDCommenter settings
vim.g.mapleader = '['
vim.g.NERDCreateDefaultMappings = true

vim.g.NERDSpaceDelims = 1

vim.g.NERDAltDelims_c = 1
vim.g.NERDAltDelims_java = 1


-- lualine
require'lualine'.setup()

-- 'silent!' so config will be loaded without errors
-- even if plugins aren't yet installed
vim.cmd 'silent! colorscheme srcery'

vim.o.guifont = 'Fira Code:h11'
