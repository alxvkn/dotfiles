local K = require 'config.util.map'

require('close_buffers').setup()

-- BDelete
K.n('<C-B>dh', [[<Cmd>lua require('close_buffers').delete { type = 'hidden' }<CR>]])
K.n('<C-B>do', [[<Cmd>lua require('close_buffers').delete { type = 'other' }<CR>]])
K.n('<C-B>da', [[<Cmd>lua require('close_buffers').delete { type = 'all' }<CR>]])
K.n('<C-B>dd', [[<Cmd>lua require('close_buffers').delete { type = 'this' }<CR>]])

-- BWipeout
K.n('<C-B>wh', [[<Cmd>lua require('close_buffers').wipe { type = 'hidden' }<CR>]])
K.n('<C-B>wo', [[<Cmd>lua require('close_buffers').wipe { type = 'other' }<CR>]])
K.n('<C-B>wa', [[<Cmd>lua require('close_buffers').wipe { type = 'all' }<CR>]])
K.n('<C-B>ww', [[<Cmd>lua require('close_buffers').wipe { type = 'this' }<CR>]])
