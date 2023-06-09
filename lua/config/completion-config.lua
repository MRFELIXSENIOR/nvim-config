local lsp = require("lspconfig")
local cmp = require("cmp")
local ap = require("nvim-autopairs.completion.cmp")

-- LSP Servers Configuration
require('mason').setup({
	ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local cap = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local function on_attach(client)
	require('completion').on_attach(client)
end

local cxx_config = {
	cmd = {
		"clangd",
		"--header-insertion=never",
		"--completion-style=detailed",
	}
}
local lua_config = { 
	Lua = { 
		diagnostics = { globals = { "vim" } } 
	}, 
}
local rust_config = {
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = true;
			}
		}
	},
}

--	name, config
local configured_sv = {
	{ "lua_ls", lua_config },
	{ "clangd", cxx_config },
	{ "rust_analyzer", rust_config },
}

local no_config_sv = {
	"tsserver",
	"cmake",
}

local no_config = { capabilities = cap }

for i=1,#configured_sv do
	local config = configured_sv[i][2]
	config.capabilities = cap
	config.on_attach = on_attach
	lsp[configured_sv[i][1]].setup(config)
end

for i=1,#no_config_sv do
	lsp[no_config_sv[i]].setup(no_config)
end
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
