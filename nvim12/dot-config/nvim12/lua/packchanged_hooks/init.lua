---@class PackChangedData
---@field active boolean
---@field kind 'install' | 'update' | 'delete'
---@field spec vim.pack.Spec
---@field path string

local M = {}

function M.setup()
  ---@type table<string, function>
  local hooks = {
    ['telescope-fzf-native.nvim'] = require 'packchanged_hooks.build_telescope_fzf_native',
    ['nvim-treesitter'] = require 'packchanged_hooks.build_telescope_fzf_native'
  }

  vim.api.nvim_create_autocmd('PackChanged', {
    group = vim.api.nvim_create_augroup('my.packchanged_hooks', {}),
    callback = function(e)
      local name = e.data.spec.name
      if hooks[name] ~= nil then
        vim.notify('hook for plugin ' .. name .. ' found, running')
        hooks[name](e.data)
      end
    end
  })
end

return M
