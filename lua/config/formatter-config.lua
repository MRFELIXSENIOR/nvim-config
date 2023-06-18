local util = require('formatter.util')

require('formatter').setup({
	filetype = {
		cpp = {
			require('formatter.filetypes.cpp').clangformat,
			function()
				return {
					exe = "clang-format",
					args = {
						[[--style="{BasedOnStyle: llvm, IndentWidth: 4}"]],
						"--assume-filename",
						util.escape_path(util.get_current_buffer_file_name()),
					},
					stdin = true,
				}
			end
		}
	}
})