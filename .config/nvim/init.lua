local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) ~= 0 then
    InstallPacker = function()
        vim.fn.system({'git', 'clone', '--depth=1', 'https://github.com/wbthomason/packer.nvim', packer_path})
        print'msg from InstallPacker()'
    end
    print'no packer.nvim found in default location, InstallPacker lua function defined'
else
    require'plugins'
end


local function map(mode, lhs, rhs, opts)
    if opts then opts['noremap'] = true
    else opts = {noremap = true} end
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

vim.o.termguicolors = true

-- alacritty mouse workaround
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


-- airline settings
vim.g.airline_section_z = '%L lines | %l:%c | %p%%'
vim.g.airline_theme = 'srcery'

-- 'silent!' so config will be loaded without errors
-- even if plugins aren't yet installed
vim.cmd 'silent! colorscheme srcery'

vim.o.guifont = 'Fira Code:h11'
