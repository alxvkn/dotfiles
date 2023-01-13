-- installing packer.nvim if it isn't already installed
local packer_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) ~= 0 then
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
for _,file in ipairs(plugin_spec_files) do
  vim.cmd.source(file)
end
