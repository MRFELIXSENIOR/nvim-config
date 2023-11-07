local theme = {}

local config_path = vim.fn.stdpath('config')
local theme_path = tostring(config_path) .. '\\theme.txt'

local io = require('io')

theme.Setup = function()
	vim.api.nvim_create_user_command(
		'ChangeTheme',
		function(opts)
			local file = io.open(theme_path, 'w')
			
			file:write(tostring(opts.fargs[1]))
			local ok, _ = pcall(vim.cmd, ('colorscheme '.. tostring(opts.fargs[1])))
			if not ok then
				file:write('default')
				vim.cmd 'colorscheme default'
			end
			file:close()
		end,
		{ 
			nargs = 1,
			complete = function(ArgLead, CmdLine, CursorPos)
				return vim.fn.getcompletion('', 'color')
			end
		}
	)
end

theme.Apply = function()
	local file = io.open(theme_path, 'r')
	local content = file:read()
	if content then
		local ok, _ = pcall(vim.cmd, ('colorscheme '.. content))
		if not ok then
			vim.cmd 'colorscheme default'
		end
	end
	file:close()
end

return theme