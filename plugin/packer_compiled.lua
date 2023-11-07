-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\phamt\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1696883897\\share\\lua\\5.1\\?.lua;C:\\Users\\phamt\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1696883897\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\phamt\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1696883897\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\phamt\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1696883897\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\phamt\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1696883897\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  ["auto-save.nvim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\auto-save.nvim",
    url = "https://github.com/Pocco81/auto-save.nvim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["monokai.nvim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\monokai.nvim",
    url = "https://github.com/tanvirtin/monokai.nvim"
  },
  ["neoscroll.nvim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["neovim-session-manager"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neovim-session-manager",
    url = "https://github.com/Shatur/neovim-session-manager"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  nvim = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim",
    url = "https://github.com/catppuccin/nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-yarp"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-yarp",
    url = "https://github.com/roxma/nvim-yarp"
  },
  ["one_monokai.nvim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\one_monokai.nvim",
    url = "https://github.com/cpea2506/one_monokai.nvim"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\onedark.vim",
    url = "https://github.com/joshdick/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["presence.nvim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\presence.nvim",
    url = "https://github.com/andweeb/presence.nvim"
  },
  ["pretty-fold.nvim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\pretty-fold.nvim",
    url = "https://github.com/anuvyklack/pretty-fold.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-hug-neovim-rpc"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-hug-neovim-rpc",
    url = "https://github.com/roxma/vim-hug-neovim-rpc"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["wilder.nvim"] = {
    loaded = true,
    path = "C:\\Users\\phamt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\wilder.nvim",
    url = "https://github.com/gelguy/wilder.nvim"
  }
}

time([[Defining packer_plugins]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
