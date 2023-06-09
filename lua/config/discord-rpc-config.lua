local rpc = require('presence')

rpc.setup({
    auto_update = true,
    neovim_image_text = 'NVCode',
    main_image = 'neovim',
    buttons = true,
	enable_line_number = true,
	show_time = true,

    editing_text = "Coding",
    file_explorer_text = 'Finding %s',
    git_commit_text = "Commiting...",
    workspace_text = 'In %s',
    plugin_manager_text = 'Managing Plugins'
})
