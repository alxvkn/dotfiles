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
vim.o.relativenumber = true

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
local f = io.open(os.getenv('HOME') .. '/.cache/wal/colors-wal.vim', 'r')
if f ~= nil then
  f:close()
  require('pywal').setup()
else
  vim.cmd[[colorscheme base16-gruvbox-material-dark-hard]]
end
vim.o.guifont = 'Fira Code:h10'

vim.o.title = true

if vim.g.neovide then
  vim.g.neovide_transparency = 0.8
  vim.g.neovide_cursor_vfx_mode = 'sonicboom'
  vim.g.neovide_cursor_animation_length = 0.15
  vim.g.neovide_cursor_trail_size = 0.3
  vim.g.neovide_refresh_rate = 80
end
