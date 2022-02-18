require('transparent').setup {
  enable = true,
  extra_groups = {
    'GitSignsAdd',
    'GitSignsChangeNr',
    'GitSignsDelete',
    'GitSignsDelete',
    'GitSignsChange',
    'lualine_c_normal', -- TODO: all other modes and separators
  },
}
