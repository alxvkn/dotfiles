require('packer').use {
  'ahmedkhalf/project.nvim',
  config = function()
    require('project_nvim').setup {
      scope_chdir = 'global'
    }
  end
}
