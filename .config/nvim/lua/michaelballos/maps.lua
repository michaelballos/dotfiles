-- vim key mappings
local map = require('utils').map

-- leader key is comma
vim.g.mapleader = ';'

-- format
map('n', '<leader>.', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })

-- switch panes
map('n', '<leader>j', '<C-w>j', { silent = true })
map('n', '<leader>k', '<C-w>k', { silent = true })
map('n', '<leader>h', '<C-w>h', { silent = true })
map('n', '<leader>l', '<C-w>l', { silent = true })


