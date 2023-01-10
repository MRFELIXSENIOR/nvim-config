local lsp = require("lspconfig")
local cmp = require("cmp")
local ap = require("nvim-autopairs.completion.cmp")

local keymap = require("keymaps")
local opt = { noremap = true, silent = true }

keymap.nmap("gd", ":lua vim.lsp.buf.definition()<cr>", opt)
keymap.nmap("gD", ":lua vim.lsp.buf.declaration()<cr>", opt)
keymap.nmap("gi", ":lua vim.lsp.buf.implementation()<cr>", opt)
keymap.nmap("gw", ":lua vim.lsp.buf.document_symbol()<cr>", opt)
keymap.nmap("gw", ":lua vim.lsp.buf.workspace_symbol()<cr>", opt)
keymap.nmap("gr", ":lua vim.lsp.buf.references()<cr>", opt)
keymap.nmap("gt", ":lua vim.lsp.buf.type_definition()<cr>", opt)
keymap.nmap("K", ":lua vim.lsp.buf.hover()<CR>", opt)
keymap.nmap("<c-k>", ":lua vim.lsp.buf.signature_help()<cr>", opt)
keymap.nmap("<leader>af", ":lua vim.lsp.buf.code_action()<cr>", opt)
keymap.nmap("<leader>rn", ":lua vim.lsp.buf.rename()<cr>", opt)

-- LSP Servers Configuration
require("nvim-lsp-installer").setup({
	ui = {
		icons = {
			server_installed = "✅",
			server_pending = "🔄",
			server_uninstalled = "✗",
		},
	},
})

local cap = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lua_config = {
	Lua = {
		diagnostics = {
			globals = { "vim" },
		},
	},
	capabilities = cap,
}

local clangd_config = {
	capabilities = cap,
}

local tsserver_config = {
	capabilities = cap,
}

lsp["sumneko_lua"].setup(lua_config)
lsp["clangd"].setup(clangd_config)
lsp["tsserver"].setup(tsserver_config)
--End LSPConfig

--CMP Configuration

local cmp_kinds = {
	Text = "  ",
	Method = "  ",
	Function = "  ",
	Constructor = "  ",
	Field = "  ",
	Variable = "  ",
	Class = "  ",
	Interface = "  ",
	Module = "  ",
	Property = "  ",
	Unit = "  ",
	Value = "  ",
	Enum = "  ",
	Keyword = "  ",
	Snippet = "  ",
	Color = "  ",
	File = "  ",
	Reference = "  ",
	Folder = "  ",
	EnumMember = "  ",
	Constant = "  ",
	Struct = "  ",
	Event = "  ",
	Operator = "  ",
	TypeParameter = "  ",
}

cmp.setup({
	completion = { completeopt = "menu,menuone,noinsert" },
	enabled = function()
		local context = require("cmp.config.context")
		if vim.api.nvim_get_mode().mode == "c" then
			return true
		else
			return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
		end
	end,
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
		},
		documentation = { border = "rounded" },
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
	}),

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
	}, {
		{ name = "buffer" },
	}),

	formatting = {
		format = function(_, vim_item)
			vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
			return vim_item
		end,
	},
})

cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" },
	}, {
		{ name = "buffer" },
	}),
})

cmp.event:on("confirm_done", ap.on_confirm_done())
