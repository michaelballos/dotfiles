-- vim key mappings
local map = require('utils').map

-- leader key is comma
vim.g.mapleader = ';'

-- format
map('n', '<leader>.', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })
