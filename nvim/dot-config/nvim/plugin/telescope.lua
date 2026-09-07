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
