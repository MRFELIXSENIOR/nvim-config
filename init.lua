local theme = 'gruvbox'

local set = vim.opt
local au = vim.api.nvim_create_autocmd
local augr = vim.api.nvim_create_augroup

vim.cmd "set noswapfile"
vim.cmd "set cmdheight=1"

set.syn = 'on'
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.autoindent = true
set.smarttab = true
set.smartcase = true
set.number = true

set.is = true
set.si = true
set.hlsearch = true
set.incsearch = true
set.encoding = 'utf-8'
set.signcolumn = 'yes:2'
set.clipboard = 'unnamedplus'

set.mouse = 'a'
set.hidden = true
set.updatetime = 150
set.cursorline = true
set.termguicolors = true
set.background = 'dark'

local plugins = require("plugins")
plugins.Load()

require("impatient")
require("gruvbox").setup({
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = false,
		operators = false,
		comments = false,
		folds = false,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	overrides = {},
})

local keymaps = require("keymaps")
keymaps.LoadKeyMaps()

require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt" },
	disable_in_macro = true,
	disable_in_visualblock = true,
	enable_bracket_in_quote = true,
})

local augrCmd = augr("AutocmdGroup", {})
au({ "CursorHold" }, {
	group = augrCmd,
	callback = function()
		vim.diagnostic.open_float({ scope = 'cursor' })
	end,
})

au({ "BufWritePre" }, {
	group = augrCmd,
	callback = function()
		vim.cmd "Format"
	end,
})

vim.cmd("colorscheme "..theme)