-- vim key mappings
local map = require('utils').map

-- leader key
vim.g.mapleader = ';'

-- map opts
local silent = {
  silent = true
}

--$ format - i usually dont use formatters just vims '=' sign to fix indents
map('n', '<leader>;', '<cmd>lua vim.lsp.buf.formatting()<CR>', silent)

--$ vim navigation
-- switch panes
map('n', '<C-j>', '<C-w>j', silent)
map('n', '<C-k>', '<C-w>k', silent)
map('n', '<C-h>', '<C-w>h', silent)
map('n', '<C-l>', '<C-w>l', silent)

--$ file
-- quick close file no save
map('n', '<leader>q', '<cmd>:q<CR>', silent)
--- quick save file
map('n', '<leader>w', '<cmd>:w<CR>', silent)
-- new vertical split
map('n', '<C-t>', '<cmd>:vnew<CR>', silent)
-- new buffer
map('n', '<C-n>', '<cmd>:enew<CR>', silent)

--$ diagnostics
-- lsp
map('n', '<space>e', vim.diagnostic.open_float, silent)
map('n', '[d', vim.diagnostic.goto_prev, silent)
map('n', ']d', vim.diagnostic.goto_next, silent)
map('n', '<space>q', vim.diagnostic.setloclist, silent)
-- lspsaga
map('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', silent)
map('n', 'gh', '<Cmd>Lspsaga hover_doc<cr>', silent)
map('n', 'gd', '<Cmd>Lspsaga lsp_finder<cr>', silent)
map('i', '<C-k>', '<Cmd>Lspsaga signature_help<cr>', silent)
map('n', 'gp', '<Cmd>Lspsaga preview_definition<cr>', silent)
map('n', 'gr', '<Cmd>Lspsaga rename<cr>', silent)

