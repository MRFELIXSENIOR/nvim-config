local rpc = require('presence')

rpc:setup {
    auto_update = true,
    neovim_image_text = 'NVCode',
    main_image = 'neovim',
    buttons = true,

    editting_text = 'Coding %s',
    file_explorer_text = 'Finding %s',
    git_commit_text = "Commiting...",
    workspace_text = 'workspace: %s',
    plugin_manager_text = 'managing plugins'
}
