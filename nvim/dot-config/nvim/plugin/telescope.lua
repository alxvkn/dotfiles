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
