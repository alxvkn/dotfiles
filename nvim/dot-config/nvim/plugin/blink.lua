vim.api.nvim_create_autocmd({ 'InsertEnter', 'CmdLineEnter' }, {
  group = vim.api.nvim_create_augroup('my.blink', {}),
  once = true,
  callback = function()
    vim.pack.add { 'https://github.com/saghen/blink.lib' }
    vim.pack.add { 'https://github.com/saghen/blink.cmp' }

    -- takes forever, requires cargo
    -- require('blink.cmp').build():pwait()
    require('blink.cmp').setup {
      keymap = {
        preset = 'super-tab',
        ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
      },
      signature = { enabled = true },
      completion = {
        -- menu = { auto_show = false },
        -- ghost_text = {
        --   enabled = true,
        --   show_with_menu = false,
        -- },
        documentation = {
          auto_show = true
        }
      },
      fuzzy = { implementation = 'lua' } -- build if not lua
    }
  end
})
