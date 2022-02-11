local K = require 'config.util.map'

K.n('<A-;>', "<Cmd>lua require('FTerm').toggle()<CR>")
K.t('<A-;>', "<C-\\><C-n><Cmd>lua require('FTerm').toggle()<CR>")
