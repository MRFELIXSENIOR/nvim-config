local ts = require 'nvim-treesitter.configs'

ts.setup {
    ensure_installed = {
		'cpp', 'lua', 'typescript', 'rust'
	},
    highlight = {
        enable = true,
    },

    indent = {
        enable = true
    },
}
