return {
  'https://github.com/andersevenrud/nvim_context_vt',
  config = function()
    require('nvim_context_vt').setup {
      prefix = '',
      disable_virtual_lines = true,
    }
  end
}
