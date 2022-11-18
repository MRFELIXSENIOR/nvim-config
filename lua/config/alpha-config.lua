local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local session_mgr = require("session_manager")
local path = require("plenary.path")

session_mgr.setup({
	sessions_dir = path:new(vim.fn.stdpath("data"), "sessions"),
	autosave_only_in_session = false,
	autoload_mode = "Disabled",
	autoload_last_session = false,
	autosave_ignore_not_normal = true,
})

local ts_find =
	[[<cmd>lua require("telescope.builtin").find_files(require("telescope.themes").get_ivy({ winblend = 20 }))<CR>]]

dashboard.section.header.val = {
	"                                                     ",
	"  ███▄    █ ██▒   █▓ ▄████▄   ▒█████  ▓█████▄ ▓█████  ",
	"  ██ ▀█   █▓██░   █▒▒██▀ ▀█  ▒██▒  ██▒▒██▀ ██▌▓█   ▀  ",
	" ▓██  ▀█ ██▒▓██  █▒░▒▓█    ▄ ▒██░  ██▒░██   █▌▒███    ",
	" ▓██▒  ▐▌██▒ ▒██ █░░▒▓▓▄ ▄██▒▒██   ██░░▓█▄   ▌▒▓█  ▄  ",
	" ▒██░   ▓██░  ▒▀█░  ▒ ▓███▀ ░░ ████▓▒░░▒████▓ ░▒████▒ ",
	" ░ ▒░   ▒ ▒   ░ ▐░  ░ ░▒ ▒  ░░ ▒░▒░▒░  ▒▒▓  ▒ ░░ ▒░ ░ ",
	" ░ ░░   ░ ▒░  ░ ░░    ░  ▒     ░ ▒ ▒░  ░ ▒  ▒  ░ ░  ░ ",
	"    ░   ░ ░     ░░  ░        ░ ░ ░ ▒   ░ ░  ░    ░    ",
	"          ░      ░  ░ ░          ░ ░     ░       ░  ░ ",
	"                ░   ░                  ░              ",
	"                                                      ",
}

local button = dashboard.button
dashboard.section.buttons.val = {
	button("e", "1.   > New file", ":silent ene <BAR> startinsert<CR>"),
	button("r", "2.   > Recent", ":silent SessionManager load_last_session<CR>"),
	button("d", "3.   > Session In Current Directory", ":silent SessionManager load_current_dir_session<CR>"),
	button("f", "4.   > Find file", ts_find),
	button("s", "5.   > Settings", ":silent e $MYVIMRC | :cd %:p:h<CR>"),
	button("q", "6.   > Exit NEOVIM", ":silent qa<CR>"),
}

alpha.setup(dashboard.opts)
