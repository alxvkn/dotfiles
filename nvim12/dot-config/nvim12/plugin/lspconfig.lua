vim.pack.add { 'https://github.com/neovim/nvim-lspconfig' }

---@type vim.lsp.Config[]
local servers = {
  {
    'lua_ls',
    ---@type lspconfig.settings.lua_ls
    settings = {
      Lua = {
        workspace = {
          library = {
            vim.fn.stdpath('data') .. '/site/pack/core/opt/nvim-lspconfig',
            vim.env.VIMRUNTIME,
          }
        }
      }
    }
  },
  { 'clangd' },
  { 'bashls' },
  { 'pyright' },
  { 'rust_analyzer' },
  { 'dartls' },
  { 'emmet_ls' },
  { 'html' },
  { 'htmx' },
  { 'vala_ls' },
  { 'phpactor' },
  { 'jdtls' },
  { 'kotlin_language_server' },
  { 'cmake' },
  { 'mesonlsp' },
  { 'tinymist' },
  { 'cssls' },
  { 'tailwindcss' },
  { 'csharp_ls' },
  { 'lua_ls' },
  { 'jsonls' },
  { 'yamlls' },
  { 'ansiblels' },
  { 'lemminx' },
  { 'gopls' },
  -- { 'denols' },
  { 'ts_ls' },
  { 'svelte' },
  { 'glsl_analyzer' },
}

for _, s in ipairs(servers) do
  local name = s[1]
  local config = {}

  for k, v in pairs(s) do
    if type(k) ~= 'number' then
      config[k] = v
    end
  end

  if #config then
    vim.lsp.config(name, config)
  end

  vim.lsp.enable(name)
end

local augroup = vim.api.nvim_create_augroup('my.lsp_setup', {})
vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup,
  callback = function()
    local signs = {
      [vim.diagnostic.severity.ERROR] = '󰚌',
      [vim.diagnostic.severity.WARN] = '󰀪',
      [vim.diagnostic.severity.INFO] = '󰋽',
      [vim.diagnostic.severity.HINT] = '󰌶',
    }

    vim.o.signcolumn = 'yes'
    vim.diagnostic.config({
      signs = { text = signs },
      float = {
        severity_sort = true,
      },
      virtual_text = {
        current_line = false,
        prefix = '',
      },
      severity_sort = true,
      jump = { float = true },
    })

    vim.keymap.set('n', 'grf', vim.lsp.buf.format, { buf = 0 })

    vim.keymap.set('n', 'K', function()
      local d = vim.diagnostic.get_next { count = 1 }
      if d == nil then
        vim.lsp.buf.hover()
        return
      end

      local cursor = vim.api.nvim_win_get_cursor(0)
      local c = {
        line = cursor[1],
        col = cursor[2],
      }

      if c.line >= d.lnum + 1 and c.line <= d.end_lnum + 1
        and
        c.col >= d.col and c.col <= d.end_col
        then
        vim.diagnostic.open_float()
      else
        vim.lsp.buf.hover()
      end
    end, { buffer = 0 })

  end
})
