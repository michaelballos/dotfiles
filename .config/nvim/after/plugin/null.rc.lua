local present, null_ls = pcall(require, "null-ls")
if not present then
  return
end

local b = null_ls.builtins

-- code action sources
local code_actions = b.code_actions

-- diagnostic sources
local diagnostics = b.diagnostics

-- hover sources
local hover = b.hover

-- completion sources
local completion = b.completion

local sources = {
  diagnostics.tsc,
  code_actions.eslint,
  code_actions.gitsigns,
  completion.luasnip,
  hover.dictionary
}

null_ls.setup({ sources = sources })
