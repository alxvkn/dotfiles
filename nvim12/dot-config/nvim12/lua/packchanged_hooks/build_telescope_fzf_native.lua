---@param data PackChangedData
return function(data)
  vim.notify 'inside nvim12/dot-config/nvim12/lua/packchanged_hooks/build_telescope_fzf_native.lua'
  if data.kind == 'install' or data.kind == 'update' then
    local obj = vim.system({ 'make' }, { cwd = data.path }):wait()
    vim.notify(tostring(obj.code))
  end
end
