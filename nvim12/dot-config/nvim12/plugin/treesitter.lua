vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter' }

-- run :TSUpdate after update
vim.api.nvim_create_autocmd('PackChanged', {
  group = vim.api.nvim_create_augroup('my.ts_update', {}),
  callback = function(e)
    local name, kind = e.data.spec.name, e.data.kind

    if name == 'nvim-treesitter' and kind == 'update' then
      if not e.data.loaded then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd 'TSUpdate'
    end
  end
})

-- auto-start treesitter if a parser for current language is installed
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('my.ts_autostart', {}),
  callback = function(args)
    if require('util').table_has_value(
      require('nvim-treesitter').get_installed(),
      vim.treesitter.language.get_lang(args.match)
    ) then
    vim.treesitter.start()
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'
  end
end
})
