local K = require 'config.util.map'

require('close_buffers').setup()

-- BDelete
K.n('<C-B>dh', function() require('close_buffers').delete { type = 'hidden' } end)
K.n('<C-B>do', function() require('close_buffers').delete { type = 'other' } end)
K.n('<C-B>da', function() require('close_buffers').delete { type = 'all' } end)
K.n('<C-B>dd', function() require('close_buffers').delete { type = 'this' } end)

-- BWipeout
K.n('<C-B>wh', function() require('close_buffers').wipe { type = 'hidden' } end)
K.n('<C-B>wo', function() require('close_buffers').wipe { type = 'other' } end)
K.n('<C-B>wa', function() require('close_buffers').wipe { type = 'all' } end)
K.n('<C-B>ww', function() require('close_buffers').wipe { type = 'this' } end)
