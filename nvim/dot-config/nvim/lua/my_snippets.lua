local M = {}

---@type table<string, table<string, string>>
M.snippets = {
  nvim_config = {
    vpa = 'vim.pack.add { $1 }$0'
  },
  lua = {
    f = 'function() $1 end$0'
  },
  c = {
    main = 'int main(int argc, char** argv) {\n\t$0\n}'
  }
}

local function try_expand(snippets)
  local line = vim.api.nvim_get_current_line()
  local crow, ccol = unpack(vim.api.nvim_win_get_cursor(0))
  if crow == nil or ccol == nil then return end

  -- slice the line up until the cursor,
  -- then match (%w)ord characters and underscores
  -- at the end of the string
  local word_start_col = line:sub(1, ccol):find('[%w_]+$')
  if word_start_col == nil then return end

  local word = line:sub(word_start_col, ccol)

  if snippets[word] == nil then
    return
  end

  vim.api.nvim_buf_set_text(0, crow - 1, word_start_col - 1, crow - 1, ccol, {})

  vim.snippet.expand(snippets[word])
end

function M.setup()
  vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('my_snippets.filetype', { clear = true }),
    callback = function(ev)
      local snippets = M.snippets[ev.match]

      if ev.match == 'lua' then
        local filepath = vim.fs.normalize(vim.api.nvim_buf_get_name(ev.buf))

        local real_config_path = vim.fs.normalize(vim.fn.stdpath('config'))

        local is_under_real_config = vim.startswith(filepath, real_config_path .. '/')
        local is_under_stow_config = filepath:find('/nvim/dot-config/nvim/', 1, true) ~= nil

        -- if this is a neovim config lua file, append the snippets for
        -- nvim_config pseudo filetype to the local snippets map
        if is_under_real_config or is_under_stow_config then
          snippets = vim.tbl_extend('force', {}, snippets or {}, M.snippets['nvim_config'])
        end
      end

      if snippets ~= nil and next(snippets) then
        vim.keymap.set('i', '<C-j>', function() try_expand(snippets) end, { buffer = ev.buf })
      end
    end
  })
end

return M
