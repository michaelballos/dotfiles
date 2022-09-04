vim.cmd("autocmd!")
local set = vim.opt

vim.scriptencoding = 'utf-8'
set.encoding = 'utf-8'
set.fileencoding = 'utf-8'

-- tab
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.autoindent = true
set.wrap = false
set.smarttab = true

-- line
set.cursorline = true
set.number = true
set.relativenumber = true
set.smartindent = true
set.breakindent = true

-- terminal
set.termguicolors = true
set.winblend = 0
set.wildoptions = 'pum'
set.pumblend = 5
set.background = 'dark'
set.title = true
set.hlsearch = true
set.backup = false
set.showcmd = true
set.cmdheight = 1
set.laststatus = 2
set.scrolloff = 10
set.inccommand = 'split'

-- case insensitive searching unless /C or capital in search
set.ignorecase = true
set.wrap = false 
set.backspace = { 
  'start', 
  'eol', 
  'indent', 
}

-- finding files - search down into subfolders
set.path:append { '**' }
set.wildignore:append { '*/node_modules/*' }

-- undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- add asterisks in block comments
set.formatoptions:append { 'r' }

-- macos clipboard
set.clipboard:append { 'unnamedplus' }
