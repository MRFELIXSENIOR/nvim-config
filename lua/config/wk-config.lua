local wk = require("which-key")

local normal_opt = {
	mode = "n",
	silent = true,
	noremap = true,
}

wk.register({
	["<leader>"] = {
		f = "Find File",
		D = "Diagnostics",
		d = "Find Definition",
		c = "Code Action Menu",
		['`'] = "Open Neovim Config",
		x = "Open Explorer",
	},
	normal_opt,
})

wk.register({
	['s'] = {
		K = "Hover",
		S = "Open Colorscheme",
		w = "Find Document Symbol",
		W = "Find Workspace Symbol",
	},
	normal_opt,
})