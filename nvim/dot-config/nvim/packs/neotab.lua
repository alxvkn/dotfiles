return {
  'kawre/neotab.nvim',
  config = function()
    require('neotab').setup {
      smart_punctuators = {
        enabled = true,
        escape = {
          enabled = true,
          triggers = {
            [','] = {
              pairs = {
                { open = "'", close = "'" },
                { open = '"', close = '"' },
              },
              format = '%s', -- ", "
            },
          }
        }
      },
    }
  end
}
