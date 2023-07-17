vim.keymap.set('n', '<Leader>tr', function()
  -- load existing highlights and only change background
  -- some goofy rocket science just for transparent shit 🤠
  local highlight_names = {
    'Normal',
    'NormalNC',
    'NormalFloat',
    'FloatBorder',

    'GitSignsAdd',
    'GitSignsChange',
    'GitSignsDelete',

    'TelescopeNormal',

    -- silly but i don't want to know how to
    -- customize lualine theme it's hard
    'lualine_c_normal',
    'lualine_c_insert',
    'lualine_c_visual',
    'lualine_c_command',
  }

  for _, name in ipairs(highlight_names) do
    local hl = vim.api.nvim_get_hl(0, { name = name })
    hl.bg = 'none'
    vim.api.nvim_set_hl(0, name, hl)
  end
end)
