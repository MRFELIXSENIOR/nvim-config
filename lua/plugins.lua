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
	require("config.lualine-config")
	require("config.wilder-config")
	require("config.nvim-tree-config")
	require("config.nvim-treesitter-config")
	require("config.nvim-notify-config")
	require("config.telescope-config")
	require("config.nvim-lsp-config")
	require("config.autosave-config")
	require("config.nvim-cmp-config")
	require("config.alpha-config")
	require("config.discord-rpc-config")
	require("config.wk-config")
	require("config.bufferline-config")
end

vim.cmd("packadd packer.nvim")
Manager = {
	["LoadPacker"] = function()
		packer.startup(function(use)
			use("wbthomason/packer.nvim")

			use("lifepillar/vim-gruvbox8")
			use("joshdick/onedark.vim")

			use("nvim-treesitter/nvim-treesitter")

			use("rcarriga/nvim-notify")
			use("nvim-lualine/lualine.nvim")

			use("kyazdani42/nvim-web-devicons")

			use("907th/vim-auto-save")
			use("karb94/neoscroll.nvim")
			use("easymotion/vim-easymotion")

			use({
				"kyazdani42/nvim-tree.lua",
				tag = "nightly",
			})

			use("cdelledonne/vim-cmake")
			use("tpope/vim-fugitive")

			use("antoinemadec/FixCursorHold.nvim")

			use({
				"gelguy/wilder.nvim",
				requires = {
					"roxma/nvim-yarp",
					"roxma/vim-hug-neovim-rpc",
				},
			})

			use("neovim/nvim-lspconfig")
			use("williamboman/nvim-lsp-installer")
			use("onsails/lspkind.nvim")

			use({
				"hrsh7th/nvim-cmp",
				requires = {
					"hrsh7th/cmp-nvim-lsp",
					"hrsh7th/cmp-buffer",
					"hrsh7th/cmp-path",
				},
			})

			use({
				"L3MON4D3/LuaSnip",
				requires = {
					"saadparwaiz1/cmp_luasnip",
				},
			})

			use("Pocco81/AutoSave.nvim")
			use("Shatur/neovim-session-manager")

			use("machakann/vim-sandwich")
			use("windwp/nvim-autopairs")

			use({
				"nvim-telescope/telescope.nvim",
				requires = { "nvim-lua/plenary.nvim" },
			})

			use("goolord/alpha-nvim")
			use("andweeb/presence.nvim")

			use("skywind3000/asyncrun.vim")
			use("folke/which-key.nvim")
			use("akinsho/bufferline.nvim")

			use("sbdchd/neoformat")
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
    end
}

return Manager
