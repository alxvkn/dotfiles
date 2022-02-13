local K = require 'config.util.map'

require('FTerm').setup {
  dimensions = {
    width = 1,
    height = 1,
  },
}
K.n('<A-;>', "<Cmd>lua require('FTerm').toggle()<CR>")
K.t('<A-;>', "<C-\\><C-n><Cmd>lua require('FTerm').toggle()<CR>")
