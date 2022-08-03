local set = vim.opt

local function exec(cmd)
	vim.cmd(tostring(cmd))
end

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

exec("set noswapfile")
exec("set cmdheight=1")
vim.g.did_load_filetypes = 1
set.syn = "on"
set.expandtab = true
set.shiftwidth = 4
set.softtabstop = 4
set.tabstop = 4

set.smarttab = true
set.smartcase = true

set.number = true

set.is = true
set.si = true
set.hlsearch = true
set.incsearch = true
set.encoding = "utf-8"
set.signcolumn = "yes:2"
set.clipboard = "unnamedplus"

set.mouse = "a"
set.autoindent = true

set.termguicolors = true
set.hidden = true
set.updatetime = 300
set.cursorline = true

----- LOAD PLUGINS -----

local plugins = require("plugins")
plugins.Init()

require("impatient")
require("gruvbox").setup({
	undercurl = true,
	underline = true,
	bold = true,
	italic = false,
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	overrides = {},
})

local keymaps = require("keymaps")
keymaps.LoadKeyMaps()

local function setColorscheme(name)
	exec("colorscheme " .. name)
end

require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt" },
	disable_in_macro = true,
	disable_in_visualblock = true,
	enable_bracket_in_quote = true,
})

autocmd({ "CursorHold" }, {
	group = augroup("AutoLineDiagnosticsShowing", {}),
	callback = function()
		vim.diagnostic.open_float({ scope = "cursor" })
	end,
})

autocmd({ "BufWritePre" }, {
	group = augroup("AutoFormatOnSave", {}),
	callback = function()
		exec("Neoformat")
	end,
})

exec("let g:cursorhold_updatetime = 500")
vim.o.background = "dark"

setColorscheme("gruvbox")
