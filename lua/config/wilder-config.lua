local wilder = require('wilder')

local conf = {
	border = 'rounded',
	max_height = '75%',
	min_height = 0,

	prompt_position = 'top',
	reverse = 0
}

wilder.setup ({ modes = { ':', '/', '?' } })

wilder.set_option('renderer', wilder.popupmenu_renderer(wilder.popupmenu_palette_theme(conf)))
wilder.set_option('pipeline', {
  wilder.branch(
    wilder.cmdline_pipeline({
      fuzzy = 1,
      set_pcre2_pattern = 1,
    }),
    wilder.python_search_pipeline({
      pattern = 'fuzzy',
    })
  ),
})
