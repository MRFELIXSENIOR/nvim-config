local bufferline = require('bufferline')

bufferline.setup {
    options = {
        mode = 'buffers',
        max_name_length = 18,
        tab_size = 18,
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        separator_style = 'thin'
    },

    highlights = {
        buffer_selected = {
            gui = 'none'
        }
    },
}
