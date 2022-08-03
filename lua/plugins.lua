local packer = require("packer")

packer.init({
	ensure_dependencies = true,
	opt_default = false,
	auto_reload_compiled = true,
	display = {
		open_fn = require("packer.util").float,
		working_sym = "🔄",
		error_sym = "‼",
		done_sym = "✔",
		removed_sym = "❌",
		moved_sym = "→",
		header_sym = "━",
		prompt_border = "double",
		keybindings = {
			quit = "q",
			toggle_info = "<CR>",
			diff = "d",
			prompt_revert = "r",
		},
	},
})

local function load_plugins()
	--require("config.wilder-config")
	require("config.nvim-notify-config")
	require("config.nvim-lsp-config")
	--require("config.autosave-config")
	require("config.nvim-cmp-config")
	require("config.alpha-config")
	--require("config.discord-rpc-config")
	--require("config.wk-config")
end

vim.cmd("packadd packer.nvim")
Manager = {
	["LoadPacker"] = function()
		packer.startup(function(use)
			use("wbthomason/packer.nvim")

			--use("lifepillar/vim-gruvbox8")
			use("joshdick/onedark.vim")
			use("ellisonleao/gruvbox.nvim")

			--use("Pocco81/AutoSave.nvim")
			use("Shatur/neovim-session-manager")

			--use("machakann/vim-sandwich")
			use("windwp/nvim-autopairs")

			use({
				"nvim-treesitter/nvim-treesitter",
				event = "BufWinEnter",
				config = [[require("config.nvim-treesitter-config")]],
			})
			use("lewis6991/impatient.nvim")

			use("rcarriga/nvim-notify")
			use({ "nvim-lualine/lualine.nvim", event = "BufWinEnter", config = [[require("config.lualine-config")]] })

			use("goolord/alpha-nvim")
			use({
				"weilbith/nvim-code-action-menu",
				cmd = "CodeActionMenu",
				config = [[vim.g.code_action_menu_window_border = 'single']],
			})
			--use("andweeb/presence.nvim")
			use("nathom/filetype.nvim")

			use({ "folke/which-key.nvim", event = "BufWinEnter", config = [[require("config.wk-config")]] })
			use({ "akinsho/bufferline.nvim", event = "BufWinEnter", config = [[require("config.bufferline-config")]] })

			use({ "sbdchd/neoformat", event = "BufWinEnter" })
			--use("EdenEast/nightfox.nvim")
			use("antoinemadec/FixCursorHold.nvim")

			use({ "kyazdani42/nvim-web-devicons", event = "BufWinEnter" })

			--use("easymotion/vim-easymotion")

			use({
				"kyazdani42/nvim-tree.lua",
				tag = "nightly",
				event = "BufWinEnter",
				config = [[require("config.nvim-tree-config")]],
			})

			--use("cdelledonne/vim-cmake")
			--use("tpope/vim-fugitive")

			--[[use({
				"gelguy/wilder.nvim",
				requires = {
					"roxma/nvim-yarp",
					"roxma/vim-hug-neovim-rpc",
				},
			})]]
			--

			--use("tweekmonster/startuptime.vim")
			use("neovim/nvim-lspconfig")
			use("williamboman/nvim-lsp-installer")
			use("onsails/lspkind.nvim")

			use({
				"hrsh7th/nvim-cmp",
				requires = {
					"hrsh7th/cmp-nvim-lsp",
				},
			})

			use({ "hrsh7th/cmp-vsnip", after = "nvim-cmp" })
			use({ "hrsh7th/vim-vsnip", after = "nvim-cmp" })
			use({
				"nvim-telescope/telescope.nvim",
				requires = { "nvim-lua/plenary.nvim" },
				event = "BufWinEnter",
				config = [[require("config.telescope-config")]],
			})
		end)
	end,

	["LoadPlugins"] = function()
		local success, errmsg = pcall(load_plugins)
		if success then
			vim.notify("Plugins Loaded Successfully!!", "info", { title = "info", timeout = 2000 })
		else
			vim.notify(
				"Error occured during plugins load, error:" .. tostring(errmsg),
				"error",
				{ title = "error", timeout = 2000 }
			)
		end
	end,

	["Init"] = function()
		Manager.LoadPacker()
		Manager.LoadPlugins()
	end,
}

return Manager
