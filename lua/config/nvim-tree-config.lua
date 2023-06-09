local tree = require('nvim-tree')
local treecall = require('nvim-tree.config').nvim_tree_callback
local keymaps = require('keymaps')

local function on_attach(bufnr)
	local api = require('nvim-tree.api')
	
	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	
	keymaps.nmap('d', 				api.fs.remove, 				opts('Delete'))
	keymaps.nmap('D', 				api.fs.trash,				opts('Trash'))
	keymaps.nmap('a', 				api.fs.create, 				opts('Create'))
	keymaps.nmap('r', 				api.fs.rename,				opts('Rename'))
	keymaps.nmap('R', 				api.fs.reload,				opts('Refresh'))
	keymaps.nmap('S', 				api.tree.search_node,		opts('Search'))
	keymaps.nmap('w', 				api.tree.collapse_all,		opts('Collapse All'))
	keymaps.nmap('e', 				api.tree.expand_all,		opts('Expand All'))
	keymaps.nmap('Y', 				api.fs.copy.relative_path,	opts('Copy Path'))
	keymaps.nmap('x', 				api.fs.cut,					opts('Cut'))
	keymaps.nmap('c', 				api.fs.copy.node,			opts('Copy'))
	keymaps.nmap('p',				api.fs.paste,				opts('Paste'))
	keymaps.nmap('q',				api.tree.close,				opts('Close'))
	keymaps.nmap('<Tab>',			api.node.open.preview,		opts('Open Preview'))
	keymaps.nmap('<CR>', 			api.node.open.edit,			opts('Open'))
	keymaps.nmap('<2-LeftMouse>',	api.node.open.edit,			opts('Open'))
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
