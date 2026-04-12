---@param data PackChangedData
return function(data)
  if data.kind == 'update' then
    if not data.active then
      vim.cmd.packadd('nvim-treesitter')
    end
    vim.cmd 'TSUpdate'
  end
end
