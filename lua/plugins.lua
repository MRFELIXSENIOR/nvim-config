local function LoadManager()
	local packer = require 'packer' 
	packer.startup(function(use)
		use 'wbthomason/packer.nvim'

		use "joshdick/onedark.vim"
		use "ellisonleao/gruvbox.nvim"
		use "EdenEast/nightfox.nvim"
		use "catppuccin/nvim"
		use "cpea2506/one_monokai.nvim"
		use "tanvirtin/monokai.nvim"

		use "Pocco81/auto-save.nvim"
		use "Shatur/neovim-session-manager"

		use "machakann/vim-sandwich"
		use "windwp/nvim-autopairs"

		use "nvim-treesitter/nvim-treesitter"
		use "lewis6991/impatient.nvim"

		use "rcarriga/nvim-notify"
		use "nvim-lualine/lualine.nvim"
		use "akinsho/bufferline.nvim"
		use 'mhartington/formatter.nvim'
		use "folke/which-key.nvim"
		use "weilbith/nvim-code-action-menu"
		use "antoinemadec/FixCursorHold.nvim"
		use "andweeb/presence.nvim"

		use "kyazdani42/nvim-web-devicons"
		use "kyazdani42/nvim-tree.lua"
		use "gelguy/wilder.nvim"
		use "roxma/nvim-yarp"
		use "roxma/vim-hug-neovim-rpc"
		
		use "anuvyklack/pretty-fold.nvim"
		use "neovim/nvim-lspconfig"
		use "williamboman/mason.nvim"
		use "onsails/lspkind.nvim"

		use "hrsh7th/nvim-cmp"
		use "hrsh7th/cmp-nvim-lsp"
		use "hrsh7th/cmp-vsnip"
		use "hrsh7th/vim-vsnip"

		use "nvim-telescope/telescope.nvim"
        use "nvim-lua/plenary.nvim"
	end)
end

function LoadConfig()
	require("config.wilder-config")
	require("config.telescope-config")
	require("config.formatter-config")
	require("config.session-mgr-config")
	require("config.nvim-notify-config")
	require("config.completion-config")
	require("config.autosave-config")
    require("config.nvim-tree-config")
    require("config.nvim-treesitter-config")
    require("config.lualine-config")
    require("config.bufferline-config")
	require("config.discord-rpc-config")
	require('config.fold-config')
	require("config.wk-config")
end

function Setup()
	require("impatient")
	require("gruvbox").setup({
		undercurl = true,
		underline = true,
		bold = true,
		italic = {
			strings = false,
			operators = false,
			comments = false,
			folds = false,
		},
		strikethrough = true,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		overrides = {},
	})


	require("nvim-autopairs").setup({
		disable_filetype = { "TelescopePrompt" },
		disable_in_macro = true,
		disable_in_visualblock = true,
		enable_bracket_in_quote = true,
	})
end

Manager = {
	["Load"] = function()
		LoadManager()
		
		local success, errmsg = pcall(LoadConfig)
		if success then
			vim.notify("Plugins Loaded!", "info", { title = "info", timeout = 2000 })
		else
			vim.notify(
				"Loading Plugins Error, error:" .. tostring(errmsg),
				"error",
				{ title = "error", timeout = 2000 }
			)
		end
	end,
	
	["Setup"] = Setup
}

return Manager
