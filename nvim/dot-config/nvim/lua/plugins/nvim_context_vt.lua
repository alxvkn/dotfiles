---@type LazySpec
return {
  'https://github.com/andersevenrud/nvim_context_vt',
  config = function()
    vim.cmd[[hi ContextVt ctermbg=black ctermfg=gray guibg=black guifg=gray cterm=italic gui=italic]]
    require('nvim_context_vt').setup {
      prefix = '󱞿',
      disable_virtual_lines = true,
      min_rows = 10,
    }
  end
}
