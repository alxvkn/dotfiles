-- build on install
-- vim.api.nvim_create_autocmd('PackChanged', {
--   group = vim.api.nvim_create_augroup('my.build_blink', {}),
--   callback = function(e)
--     local name, kind = e.data.spec.name, e.data.kind
--
--     if name == 'blink.cmp' and kind == 'install' or kidn == 'update' then
--       vim.system({ 'cargo', 'build', '--release' }, { cwd = e.data.path })
--     end
--   end
-- })

vim.pack.add { 'https://github.com/saghen/blink.cmp' }

require('blink.cmp').setup {
  keymap = {
    preset = 'super-tab',
    ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
    ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
  },
  signature = { enabled = true },
  completion = {
    menu = { auto_show = false },
    ghost_text = {
      enabled = true,
      show_with_menu = false,
    },
    documentation = {
      auto_show = true
    }
  },
  fuzzy = { implementation = 'lua' }
}
