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

  vim.cmd [[packadd packer.nvim]]
  print('packer.nvim was installed and made available, you propably should run :PackerSync and then re-source init.lua')
end

return M
