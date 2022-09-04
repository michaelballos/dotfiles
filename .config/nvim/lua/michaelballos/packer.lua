-- if there is no packer installed - clone packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  print('installing packer u lil bitch')
  packer_bootstrap = fn.system({
    'git', 
    'clone', 
    '--depth', 
    '1', 
    'https://github.com/wbthomason/packer.nvim', 
    install_path
  })
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- common utils
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'
  -- monokai theme
  use {
    'tanvirtin/monokai.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  -- copilot
  use 'github/copilot.vim'
  -- status line
  use 'nvim-lualine/lualine.nvim'
  -- snippet
  use 'L3MON4D3/LuaSnip'
  use {
     -- mason
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    -- completion source for built in lsp
    'hrsh7th/cmp-nvim-lsp',
    -- cmp source for buffer words
    'hrsh7th/cmp-buffer',
    -- lsp ui
    'glepnir/lspsaga.nvim',
  }
  -- pictograms
  use 'onsails/lspkind-nvim'
  -- completion
  use 'hrsh7th/nvim-cmp'
  -- tree sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- auto pairs
  use 'windwp/nvim-autopairs'
  -- auto tag
  use 'windwp/nvim-ts-autotag'
  -- telescope sf to open
  use 'nvim-telescope/telescope.nvim'
  -- telescope extensions
  use 'nvim-telescope/telescope-file-browser.nvim'
  -- highlight colors
  use 'norcalli/nvim-colorizer.lua'
  -- git signs file changes in gutter
  use 'lewis6991/gitsigns.nvim'
  -- git diff
  use 'sindrets/diffview.nvim'
  -- hook into lsp clien
  use 'jose-elias-alvarez/null-ls.nvim'

	--[[
     --
	-- Lazy loading:
	-- Load on specific commands
	use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
	-- Load on an autocommand event
	use {'andymass/vim-matchup', event = 'VimEnter'}
	-- Load on a combination of conditions: specific filetypes or commands
	-- Also run code after load (see the 'config' key)
	use {
	'w0rp/ale',
	ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
	cmd = 'ALEEnable',
	config = 'vim.cmd[[ALEEnable]]--[['
	}
	-- Plugins can have dependencies on other plugins
	use {
	'haorenW1025/completion-nvim',
	opt = true,
	requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
	}
	-- Plugins can also depend on rocks from luarocks.org:
	use {
	'my/supercoolplugin',
	rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
	}
	-- You can specify rocks in isolation
	use_rocks 'penlight'
	use_rocks {'lua-resty-http', 'lpeg'}
	-- Local plugins can be included
	use '~/projects/personal/hover.nvim'
	-- Plugins can have post-install/update hooks
	use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
	-- Post-install/update hook with neovim command
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	-- Post-install/update hook with call of vimscript function with argument
	use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
	-- Use specific branch, dependency and run lua file after load
	use {
	'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
	requires = {'kyazdani42/nvim-web-devicons'}
	}
	-- Use dependency and run lua function after load
	use {
	'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
	config = function() require('gitsigns').setup() end
	}
	-- You can specify multiple plugins in a single call
	use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}
	-- You can alias plugin names
	use {'dracula/vim', as = 'dracula'}
	end)
	--]]
  if packer_bootstrap then
    require('packer').sync()
  end
end)
