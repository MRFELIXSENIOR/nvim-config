local set = vim.opt
local au = vim.api.nvim_create_autocmd
local augr = vim.api.nvim_create_augroup

set.swapfile = false

set.syn = 'on'
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.autoindent = true
set.smarttab = true
set.smartcase = true
set.smartindent = true
set.cindent = true
set.number = true

set.is = true
set.hlsearch = true
set.incsearch = true
set.encoding = 'utf-8'
set.signcolumn = 'yes:2'
set.clipboard = 'unnamedplus'

set.foldenable = true
set.foldcolumn = '1'
set.foldlevel = 99
set.foldlevelstart = 99

set.mouse = 'a'
set.hidden = true
set.updatetime = 100
set.cursorline = true
set.termguicolors = true
set.background = 'dark'

require('plugins').Load()
require('plugins').Setup()
require("keymaps").LoadKeyMaps()
require('theme_changer').Setup()

local augrCmd = augr("AutocmdGroup", {})
au({ "CursorHold" }, {
	group = augrCmd,
	callback = function()
		vim.diagnostic.open_float({ scope = 'cursor' })
	end,
})

require('theme_changer').Apply()