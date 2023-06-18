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
	local telescope_im =
		[[<cmd>lua require("telescope.builtin").lsp_implementations(require("telescope.themes").get_dropdown({ winblend = 20 }))<CR>]]
	
	keymaps.nmap("<leader>x", ":NvimTreeToggle<CR>",opt)
	keymaps.nmap("<leader>`", ":e $MYVIMRC<CR>", 	opt)
	keymaps.nmap("<leader>c", ":CodeActionMenu<CR>",opt)
	keymaps.nmap("<leader>d", telescope_def, 		opt)
	keymaps.nmap("<leader>f", telescope_f, 			opt)
	keymaps.nmap("<leader>i", telescope_im, 		opt)

	keymaps.nmap("<leader>D", telescope_d, 			opt)
	
	--LSP Keymap Stuffs
	keymaps.nmap("gd", ":lua vim.lsp.buf.definition()<cr>", opt)
	keymaps.nmap("gD", ":lua vim.lsp.buf.declaration()<cr>", opt)
	keymaps.nmap("gi", ":lua vim.lsp.buf.implementation()<cr>", opt)
	keymaps.nmap("gw", ":lua vim.lsp.buf.document_symbol()<cr>", opt)
	keymaps.nmap("gw", ":lua vim.lsp.buf.workspace_symbol()<cr>", opt)
	keymaps.nmap("gr", ":lua vim.lsp.buf.references()<cr>", opt)
	keymaps.nmap("gt", ":lua vim.lsp.buf.type_definition()<cr>", opt)
	keymaps.nmap("K", ":lua vim.lsp.buf.hover()<CR>", opt)
	keymaps.nmap("<c-k>", ":lua vim.lsp.buf.signature_help()<cr>", opt)
	keymaps.nmap("<leader>af", ":lua vim.lsp.buf.code_action()<cr>", opt)
	keymaps.nmap("<leader>rn", ":lua vim.lsp.buf.rename()<cr>", opt)
	
	keymaps.nmap("[g", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
	keymaps.nmap("]g", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
end

return keymaps