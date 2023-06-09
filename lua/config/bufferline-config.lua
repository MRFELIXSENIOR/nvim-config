local bufferline = require('bufferline')

bufferline.setup {
    options = {
        groups = {
            items = {
                require('bufferline.groups').builtin.pinned:with({ icon = "" })
            }
        },
        mode = 'buffers',
        max_name_length = 18,
        tab_size = 18,
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        separator_style = 'thin',
    },
	highlights = {
		buffer_selected = {
			bold = true,
			italic = false,
		},
		numbers_selected = {
			bold = true,
			italic = false,
		},
		diagnostic_selected = {
			bold = true,
			italic = false,
		},
		hint_selected = {
			bold = true,
			italic = false,
		},
		hint_diagnostic_selected = {
			bold = true,
			italic = false,
		},
		info_selected = {
			bold = true,
			italic = false,
		},
		info_diagnostic_selected = {
			bold = true,
			italic = false,
		},
		warning_selected = {
			bold = true,
			italic = false,
		},
		warning_diagnostic_selected = {
			bold = true,
			italic = false,
		},
		error_selected = {
			bold = true,
			italic = false,
		},
		error_diagnostic_selected = {
			bold = true,
			italic = false,
		},
		pick_selected = {
			bold = true,
			italic = false,
		},
		pick_visible = {
			bold = true,
			italic = false,
		},
		pick = {
			bold = true,
			italic = false,
		},
	},
}
