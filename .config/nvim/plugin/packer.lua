-- installing packer.nvim if it isn't already installed
local packer_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) ~= 0 then
  require('install_packer').install(packer_path)
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
