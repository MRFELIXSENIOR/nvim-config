local function loadPaq()
	vim.cmd "packadd paq-nvim"
	require "paq" {
		{ "savq/paq-nvim", opt=true };

		"joshdick/onedark.vim";
		"ellisonleao/gruvbox.nvim";
		"EdenEast/nightfox.nvim";
		"catppuccin/nvim";

		"Pocco81/AutoSave.nvim";
		"Shatur/neovim-session-manager";

		"machakann/vim-sandwich";
		"windwp/nvim-autopairs";

		"nvim-treesitter/nvim-treesitter";
		"lewis6991/impatient.nvim";

		"rcarriga/nvim-notify";
		"nvim-lualine/lualine.nvim";
		"akinsho/bufferline.nvim";
		'mhartington/formatter.nvim';
		"folke/which-key.nvim";
		"weilbith/nvim-code-action-menu";
		"antoinemadec/FixCursorHold.nvim";
		"andweeb/presence.nvim";

		"kyazdani42/nvim-web-devicons";
		"kyazdani42/nvim-tree.lua";
		"gelguy/wilder.nvim";
		"roxma/nvim-yarp";
		"roxma/vim-hug-neovim-rpc";

		"neovim/nvim-lspconfig";
		"williamboman/mason.nvim";
		"onsails/lspkind.nvim";

		"hrsh7th/nvim-cmp";
		"hrsh7th/cmp-nvim-lsp";
		"hrsh7th/cmp-vsnip";
		"hrsh7th/vim-vsnip";

		"nvim-telescope/telescope.nvim";
        "nvim-lua/plenary.nvim"
	}
end

local function loadConfig()
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
end

Manager = {
	["LoadPaq"] = loadPaq,
	["LoadConfig"] = function()
		local success, errmsg = pcall(loadConfig)
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

	["Load"] = function()
		Manager.LoadPaq()
		Manager.LoadConfig()
	end,
}

return Manager
