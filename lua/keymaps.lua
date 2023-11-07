local mt = {}
mt.__index = mt

local keymaps = setmetatable({}, mt)

keymaps.nmap = function(key, map_to, options)
	vim.api.nvim_set_keymap("n", key, map_to, options)
end
keymaps.vmap = function(key, map_to, options)
	vim.api.nvim_set_keymap("v", key, map_to, options)
end
keymaps.imap = function(key, map_to, options)
	vim.api.nvim_set_keymap("i", key, map_to, options)
end

keymaps.LoadKeyMaps = function()
	local opt = { silent = true, noremap = true }
		
	local telescope_f =
		[[<cmd>lua require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({ winblend = 20 }))<CR>]]
	local telescope_d =
		[[<cmd>lua require("telescope.builtin").diagnostics(require("telescope.themes").get_dropdown({ winblend = 20 }))<CR>]]
	local telescope_def =
		[[<cmd>lua require("telescope.builtin").lsp_definitions(require("telescope.themes").get_dropdown({ winblend = 20 }))<CR>]]
	local telescope_colorscheme =
		[[<cmd>lua require("telescope.builtin").colorscheme(require("telescope.themes").get_dropdown({ winblend = 20 }))<CR>]]
	local telescope_doc_sym =
		[[<cmd>lua require("telescope.builtin").lsp_document_symbols(require("telescope.themes").get_dropdown({ winblend = 20 }))<CR>]]
	local telescope_ws_sym =
		[[<cmd>lua require("telescope.builtin").lsp_workspace_symbols(require("telescope.themes").get_dropdown({ winblend = 20 }))<CR>]]
	
	keymaps.nmap("<leader>x", ":NvimTreeToggle<CR>",opt)
	keymaps.nmap("<leader>`", ":e $MYVIMRC<CR>", 	opt)
	keymaps.nmap("<leader>c", ":CodeActionMenu<CR>",opt)
	keymaps.nmap("<leader>d", telescope_def, 		opt)
	keymaps.nmap("<leader>f", telescope_f, 			opt)
	keymaps.nmap("<leader>D", telescope_d, 			opt)
	
	keymaps.nmap("sK", ":lua vim.lsp.buf.hover()<CR>", 	opt)
	keymaps.nmap("sS", telescope_colorscheme,			opt)
	keymaps.nmap("sw", telescope_doc_sym,				opt)
	keymaps.nmap("sW", telescope_ws_sym,				opt)
end

return keymaps