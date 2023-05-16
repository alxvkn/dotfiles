-- installing packer.nvim if it isn't already installed
local packer_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if not vim.loop.fs_stat(packer_path) then
  require('install_packer').install(packer_path)
  return
  -- this file will re-executed by the install function,
  -- so doing the rest of the file after install is done is just a waste of resources
end

local packer = require 'packer'

packer.reset()
packer.init {
  compile_path = vim.fn.stdpath 'data' .. '/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'single' }
    end,
  },
}

-- plugin specification files
-- (there is no way to require() files by glob, so we are sourcing them)
-- for the future: i guess the whole thing is a little bit venturous and will cause problems
-- but how cool is it when you add a plugin just by creating one new file?
local plugin_spec_files = vim.fn.split(vim.fn.glob(vim.fn.stdpath('config') .. '/packs/*'), '\n')
for _, file in ipairs(plugin_spec_files) do
  vim.cmd.source(file)
end

vim.keymap.set('n', '<leader>sr',
  function() vim.cmd.runtime 'plugin/packer.lua' end,
  { desc = 'Reload packer plugin specifications' })

vim.keymap.set('n', '<leader>ss',
  require('packer').sync,
  { desc = 'Run packer.sync()' })

vim.keymap.set('n', '<leader>si',
  require('packer').install,
  { desc = 'Run packer.install()' })

vim.keymap.set('n', '<leader>sc',
  require('packer').compile,
  { desc = 'Run packer.compile()' })
