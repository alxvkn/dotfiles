-- enable mouse in all modes
vim.o.mouse = 'a'

vim.o.completeopt = 'menuone,noselect'

-- at moment i thought i understood how indentation settings work
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.autoindent = true

-- no swapfiles
vim.o.swapfile = false

vim.o.number = true
vim.o.relativenumber = true

-- TODO: change this and diagnostics settings based on screen width
vim.o.signcolumn = 'yes'

if os.getenv('TERM') ~= 'linux' then
  vim.o.termguicolors = true
end

vim.o.ignorecase = 1

-- -- only ignore case in command completion
-- vim.cmd [[
--     augroup ignorecase_commandmode
--         autocmd!
--         autocmd CmdLineEnter : let &ignorecase = 1
--         autocmd CmdLineLeave : let &ignorecase = 0
--     augroup end
-- ]]

-- https://github.com/neovim/neovim/issues/21771
local tmux_pwd_fix_augroup = vim.api.nvim_create_augroup('TmuxPwdFix', { clear = true })
vim.api.nvim_create_autocmd('DirChanged', {
  group = tmux_pwd_fix_augroup,
  pattern = '*',
  callback = function()
    vim.fn.chansend(vim.v.stderr, '\27]7;' .. vim.v.event.cwd .. '\27\\')
  end
})

vim.o.hlsearch = false
vim.o.conceallevel = 2

-- Russian keys
vim.o.langmap = 'ёйцукенгшщзхъфывапролджэячсмитьбю;`qwertyuiop[]asdfghjkl\\;\'zxcvbnm\\,.,ЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>'

vim.o.keymap = 'russian-jcukenwin'
vim.o.iminsert = 0 -- disable alternative keymap by default

vim.keymap.set('i', 'kj', '<Esc>')
vim.keymap.set('i', '<c-o>', '<c-^>')

vim.cmd.cabbrev('ц', 'w')
vim.cmd.cabbrev('й', 'q')
vim.cmd.cabbrev('цй', 'wq')
vim.cmd.cabbrev('йф', 'qa')

vim.g.mapleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', {})

vim.o.timeout = false

vim.keymap.set('t', '<A-[>', '<C-\\><C-N>')

vim.keymap.set('n', '<C-j>', '<Cmd>bnext<CR>')
vim.keymap.set('n', '<C-k>', '<Cmd>bprevious<CR>')

vim.keymap.set('n', '^', '0')
vim.keymap.set('n', '0', '^')

vim.keymap.set({'n', 'v'}, '<Leader>y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set({'n', 'v'}, '<Leader>p', '"+p', { desc = 'Paste from system clipboard' })

vim.keymap.set('n', '<Leader>T', '<Cmd>e ~/documents/college/todo.txt<cr>')

vim.o.guifont = 'Iosevka Medium:h11'

vim.o.title = true

if vim.g.neovide then
  vim.g.neovide_cursor_vfx_mode = 'sonicboom'
  vim.g.neovide_cursor_animation_length = 0.15
  vim.g.neovide_cursor_trail_size = 0.3
  vim.g.neovide_refresh_rate = 80
end

require 'lazy_bootstrap'
