local M = {}

M.install = function(path)
  print('cloning packer.nvim with git into ' .. path)
  vim.fn.system { 'git', 'clone', '--depth=1', 'https://github.com/wbthomason/packer.nvim', path }

  if vim.v.shell_error == 0 then
    print 'successfully downloaded packer.nvim'
  else
    print 'something went wrong. check if git is available in $PATH'
    return
  end

  vim.cmd.packadd 'packer.nvim'
  print('packer was installed. reloading all things that need to be reloaded you know')

  -- re-run the file that called this function
  -- to initialize the packer with desired settings
  -- it won't call this function again, since packer is already installed
  vim.cmd.runtime 'plugin/packer.lua'

  -- run packer.sync() to download all specified plugins
  -- something funny happens if packer.sync() runs without a delay
  vim.defer_fn(function()
    require('packer').sync()
  end, 1000)

  local augroup_id = vim.api.nvim_create_augroup('FinishPackerInstall', { clear = true })

  vim.api.nvim_create_autocmd('User', {
    group = augroup_id,
    pattern = 'PackerComplete',
    callback = function()
      -- delete this autocmd after first execution
      vim.api.nvim_del_augroup_by_id(augroup_id)

      print('packer just installed all specified plugins, you should restart neovim now')

      -- re-source main config file (mostly just to set colors)
      vim.cmd.runtime 'init.lua'
      -- source all plugins from start dirs in runtimepath
      vim.cmd.runtime {
        args = { 'START', '**/plugin/*' }, -- also include after/plugin
        bang = true
      }
      -- and source packer_compiled again
      -- at this point only for lualine to identify the colorscheme
      vim.cmd.runtime 'plugin/packer_compiled.lua'
    end,
  })
end

return M
