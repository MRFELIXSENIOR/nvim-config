local autosave = require("autosave")

autosave.setup({
	enabled = true,
	execution_message = "Autosaved at " .. vim.fn.strftime("%H:%M:%S"),
	events = { "CursorHold" },
	conditions = {
		exists = true,
		modifiable = true,
		filetype_is_not = {},
		filename_is_not = {},
	},
	write_all_buffers = false,
	on_off_commands = true,
	clean_command_line_interval = 0,
	debounce_delay = 200,
})
