local mt = {}
mt.__index = mt

local keymaps = setmetatable({}, mt)

keymaps.map = function(mode, key, map_to, options)
    vim.api.nvim_set_keymap(tostring(mode), tostring(key), tostring(map_to), options)
end

keymaps.nmap = function(key, map_to, options)
    vim.api.nvim_set_keymap('n', tostring(key), tostring(map_to), options)
end

keymaps.vmap = function(key, map_to, options)
    vim.api.nvim_set_keymap('v', tostring(key), tostring(map_to), options)
end

keymaps.imap = function(key, map_to, options)
    vim.api.nvim_set_keymap('i', tostring(key), tostring(map_to), options)
end

local opt = { silent = true, noremap = true }

local telescope_f = [[<cmd>lua require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({ winblend = 20 }))<CR>]]
local telescope_d = [[<cmd>lua require('telescope.builtin').diagnostics(require("telescope.themes").get_cursor {winblend = 20})<CR>]]

keymaps.LoadKeyMaps = function()
    keymaps.nmap('<leader>x', ':NvimTreeToggle<CR>', opt)
    keymaps.nmap('<leader>`', ':e $MYVIMRC<CR>', opt)
    keymaps.nmap('<leader>f', telescope_f, opt)
    keymaps.nmap('<space>gw', '<Plug>(easymotion-overwin-f2)', opt)

    keymaps.nmap('[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
    keymaps.nmap(']g', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
    keymaps.nmap('<leader>g', telescope_d, opt)
    keymaps.nmap('<leader>m', '<cmd>lua vim.lsp.buf.formatting_sync()<CR>', opt)
end

return keymaps
