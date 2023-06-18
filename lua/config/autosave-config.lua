local autosave = require("auto-save")

autosave.setup {
	enabled = true,
	execution_message = {
        message = function ()
            return ("Autosave: Saved at ".. vim.fn.strftime("%H:%M:%S"))
        end,
        dim = 0.18,
    },
	trigger_events = { "InsertLeave", "CursorHold" },
    condition = function(buf)
		local utils = require("auto-save.utils.data")

		if
			vim.fn.getbufvar(buf, "&modifiable") == 1 and
			utils.not_in(vim.fn.getbufvar(buf, "&filetype"), {}) then
			return true -- met condition(s), can save
		end
		return false -- can't save
	end,
    write_all_buffers = true,
	debounce_delay = 200,
}
