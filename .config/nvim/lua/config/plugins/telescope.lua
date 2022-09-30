local K = require 'config.util.map'

K.n('<Leader>t<Leader>', function() require('telescope.builtin').builtin() end)
K.n('<Leader>tf', function() require('telescope.builtin').find_files() end)
K.n('<Leader>tg', function() require('telescope.builtin').live_grep() end)
K.n('<Leader>tb', function() require('telescope.builtin').buffers() end)
K.n('<Leader>th', function() require('telescope.builtin').help_tags() end)
K.n('<Leader>tj', function() require('telescope.builtin').planets() end)
