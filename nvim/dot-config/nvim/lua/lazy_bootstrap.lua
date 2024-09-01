-- installing lazy.nvim if it isn't already installed
local lazy_path = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazy_path) then
  print('cloning lazy to ' .. lazy_path)
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazy_path,
  })
end

vim.opt.rtp:prepend(lazy_path)

local plugins = {}

local plugin_spec_files = vim.fn.split(vim.fn.glob(vim.fn.stdpath('config') .. '/packs/*'), '\n')
for _, file in ipairs(plugin_spec_files) do
  table.insert(plugins, dofile(file))
end

-- vim.print(plugins)

require('lazy').setup(plugins)

vim.keymap.set('n', '<leader>lr',
  function() vim.cmd.runtime 'plugin/lazy.lua' end,
  { desc = 'Reload lazy plugin specifications' })

vim.keymap.set('n', '<leader>ll',
  vim.cmd.Lazy,
  { desc = 'Open lazy.nvim' })
