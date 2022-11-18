local tree = require('nvim-tree')
local treecall = require('nvim-tree.config').nvim_tree_callback

tree.setup {
    sort_by = 'case-sensitive',
    view = {
        mappings = {
            list = {
                { key = 'c', cb = treecall 'create' },
                { key = 'd', cb = treecall 'remove' },
                { key = 'n', cb = treecall 'rename' },
                { key = 'r', cb = treecall 'refresh' },
            }
        }
    },
    filters = {
        dotfiles = false,
    },
    renderer = {
        group_empty = true,
    },
}
