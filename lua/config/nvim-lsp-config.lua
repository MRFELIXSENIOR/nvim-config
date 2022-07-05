local lsp = require("lspconfig")

local servers = require("lsp-servers")
local keymap = require("keymaps")

local opt = { noremap = true }

keymap.nmap("gd", ":lua vim.lsp.buf.definition()<cr>", opt)
keymap.nmap("gD", ":lua vim.lsp.buf.declaration()<cr>", opt)
keymap.nmap("gi", ":lua vim.lsp.buf.implementation()<cr>", opt)
keymap.nmap("gw", ":lua vim.lsp.buf.document_symbol()<cr>", opt)
keymap.nmap("gw", ":lua vim.lsp.buf.workspace_symbol()<cr>", opt)
keymap.nmap("gr", ":lua vim.lsp.buf.references()<cr>", opt)
keymap.nmap("gt", ":lua vim.lsp.buf.type_definition()<cr>", opt)
keymap.nmap("K", ":lua vim.lsp.buf.hover()<cr>", opt)
keymap.nmap("<c-k>", ":lua vim.lsp.buf.signature_help()<cr>", opt)
keymap.nmap("<leader>af", ":lua vim.lsp.buf.code_action()<cr>", opt)
keymap.nmap("<leader>rn", ":lua vim.lsp.buf.rename()<cr>", opt)

require("nvim-lsp-installer").setup({
	automatic_installation = true,
	ui = {
		icons = {
			server_installed = "✅",
			server_pending = "🔄",
			server_uninstalled = "✗",
		},
	},
})

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

for i = 1, #servers do
	lsp[servers[i]].setup({
		capabilities = capabilities,
	})

	if servers[i] == "sumneko_lua" then
		lsp["sumneko_lua"].setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},

					completion = {
						showWord = "Disable",
					},
				},
			},
			capabilities = capabilities,
		})
	end
end
