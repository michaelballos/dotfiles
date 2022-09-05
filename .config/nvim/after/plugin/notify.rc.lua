local present, notify = pcall(require, 'notify')
if (not present) then
  return
end

notify.setup({
  level = vim.log.levels.INFO,
  background_colour = '#b8878c'
})


-- set as default notification for plugins to use
vim.notify = notify
