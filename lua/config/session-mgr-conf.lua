local path = require("plenary.path")
require("session_manager").setup({
	sessions_dir = path:new(vim.fn.stdpath("data"), "sessions"),
	path_replacer = "-",
	color_replacer = "+",
	autosave_last_session = true
})
