local keymaps = require("keymaps")
keymaps.LoadKeyMaps()

local set = vim.opt

local function exec(cmd)
	vim.cmd(tostring(cmd))
end

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

exec("set noswapfile")
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
set.signcolumn = "number"
set.clipboard = "unnamedplus"

set.mouse = "a"
set.autoindent = true

set.termguicolors = true
set.hidden = true
set.updatetime = 150

----- LOAD PLUGINS -----

local plugins = require("plugins")
plugins.Init()

require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "vim" },
	disable_in_macro = true,
})

local function setColorscheme(name)
	vim.cmd("colorscheme " .. name)
end

autocmd({ "CursorHold" }, {
	group = augroup("AutoLineDiagnosticsShowing", {}),
	callback = function()
		vim.diagnostic.open_float({ scope = "cursor" })
	end,
})

autocmd({ "BufWritePost" }, {
	group = augroup("AutoFormatOnSave", {}),
	callback = function()
		vim.cmd(":Neoformat")
	end,
})

setColorscheme("onedark")
