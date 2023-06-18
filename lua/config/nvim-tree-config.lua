local tree = require('nvim-tree')
local treecall = require('nvim-tree.config').nvim_tree_callback
local keymaps = require('keymaps')

local function on_attach(bufnr)
	local api = require('nvim-tree.api')
	
	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	
	api.config.mappings.default_on_attach(bufnr)
	
	vim.keymap.set('n', 'd', 				api.fs.remove, 				opts('Delete'))
	vim.keymap.set('n', 'D', 				api.fs.trash,				opts('Trash'))
	vim.keymap.set('n', 'a', 				api.fs.create, 				opts('Create'))
	vim.keymap.set('n', 'r', 				api.fs.rename,				opts('Rename'))
	vim.keymap.set('n', 'R', 				api.tree.reload,			opts('Refresh'))
	vim.keymap.set('n', 'S', 				api.tree.search_node,		opts('Search'))
	vim.keymap.set('n', 'w', 				api.tree.collapse_all,		opts('Collapse All'))
	vim.keymap.set('n', 'e', 				api.tree.expand_all,		opts('Expand All'))
	vim.keymap.set('n', 'Y', 				api.fs.copy.relative_path,	opts('Copy Path'))
	vim.keymap.set('n', 'x', 				api.fs.cut,					opts('Cut'))
	vim.keymap.set('n', 'c', 				api.fs.copy.node,			opts('Copy'))
	vim.keymap.set('n', 'p',				api.fs.paste,				opts('Paste'))
	vim.keymap.set('n', 'q',				api.tree.close,				opts('Close'))
	vim.keymap.set('n', '<Tab>',			api.node.open.preview,		opts('Open Preview'))
	vim.keymap.set('n', '<CR>', 			api.node.open.edit,			opts('Open'))
	vim.keymap.set('n', '<2-LeftMouse>',	api.node.open.edit,			opts('Open'))
end

tree.setup {
    sort_by = 'case-sensitive',
	on_attach = on_attach,
    filters = {
        dotfiles = false,
    },
    renderer = {
        group_empty = true,
    },
}
