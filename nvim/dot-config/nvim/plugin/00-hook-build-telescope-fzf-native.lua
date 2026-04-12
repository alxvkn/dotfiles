vim.api.nvim_create_autocmd('PackChanged', {
  group = vim.api.nvim_create_augroup('my.build_fzf_native', {}),
  callback = function(e)
    ---@type PackChangedData
    local data = e.data
    if data.spec.name == 'telescope-fzf-native.nvim' and (data.kind == 'install' or data.kind == 'update') then
      vim.notify('building telescope-fzf-native.nvim with make')
      local obj = vim.system({ 'make' }, { cwd = data.path }):wait()
      if obj.code ~= 0 then
        vim.notify(
          'could not build telescope-fzf-native.nvim, make failed with code ' .. obj.code,
          vim.log.levels.ERROR)
      else
        vim.notify('successfully built telescope-fzf-native.nvim',
          vim.log.levels.INFO)
      end
    end
  end
})
