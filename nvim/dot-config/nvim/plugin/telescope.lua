local mappings = {
  ['<leader><leader>'] = 'builtin',
  ['<leader>l'] = 'live_grep',
  ['<leader>h'] = 'help_tags',
  ['<leader>b'] = 'buffers',
  ['<leader>f'] = 'git_files',
  ['<leader>F'] = 'find_files',
  ['<leader>s'] = 'lsp_dynamic_workspace_symbols',
}

local builtin = nil

local bind = require('util').bind

local function load_or_get_picker(picker)
  if builtin == nil then
    vim.pack.add({ 'https://github.com/nvim-telescope/telescope.nvim' })
    builtin = require('telescope.builtin')

    vim.pack.add({ 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' })

    pcall(require('telescope').load_extension, 'fzf')
  end

  return builtin[picker]()
end

for lhs, picker in pairs(mappings) do
  vim.keymap.set('n', lhs, bind(load_or_get_picker, picker))
end

vim.api.nvim_create_user_command('Telescope', function(t)
  vim.pack.add { 'https://github.com/nvim-telescope/telescope.nvim' }

  -- so the lazy loading on keybinds is skipped
  builtin = require('telescope.builtin')

  vim.api.nvim_cmd({ cmd = t.name, args = t.fargs }, {})
end, { nargs = '*' })

require('config_test').add(function()
  assert(pcall(require, 'telescope') == false) -- it's lazy-loaded

  require('config_test.util').feedkeys('<Leader>F')
  assert(vim.bo.filetype == 'TelescopePrompt')

  require('telescope.actions').close(vim.api.nvim_get_current_buf())
end)

-- TODO: add test for lazy-loading on :Telescope command
-- blocked by a redesign of the test runner to support running each test in a
-- fresh neovim instance, because plugins cannot be reliably unloaded
