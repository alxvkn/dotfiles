vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(e)
    ---@type PackChangedData
    local data = e.data
    if data.spec.name == 'nvim-treesitter' and data.kind == 'update' then
      if not data.active then
        vim.cmd.packadd('nvim-treesitter')
      end
      vim.notify('running :TSUpdate')
      vim.cmd 'TSUpdate'
    end
  end
})
