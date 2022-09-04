local present, monokai = pcall(require, 'monokai')
if (not present) then
  return
end

monokai.setup {
  palette = monokai.pro
}

-- make vim transparent
vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
vim.cmd[[hi SignColumn guibg=NONE ctermbg=NONE]]
vim.cmd[[hi LineNr guibg=NONE ctermbg=NONE]]
--vim.cmd[[hi CursorLineNr guibg=NONE ctermbg=NONE]]
-- vim.cmd[[hi CursorLine guibg=#32363a ctermbg=NONE]]
--vim.cmd[[hi CursorColumn guibg=NONE ctermbg=NONE]]
--vim.cmd[[hi EndOfBuffer guibg=NONE ctermbg=NONE]]
--vim.cmd[[hi ColorColumn guibg=NONE ctermbg=NONE]]
