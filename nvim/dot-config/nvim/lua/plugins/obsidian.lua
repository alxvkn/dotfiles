local notes_vault_path = vim.fn.expand '~' .. '/Documents/obsidian/notes'

---@type LazySpec
return {
  'epwalsh/obsidian.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = {
    'BufReadPre ' .. notes_vault_path .. '*.md',
    'BufNewFile ' .. notes_vault_path .. '*.md'
  },
  opts = {
    workspaces = {
      {
        name = 'notes',
        path = notes_vault_path
      }
    }
  }
}
