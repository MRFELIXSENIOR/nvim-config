local cmp = require 'cmp'
local lspkind = require 'lspkind'
local ap = require('nvim-autopairs.completion.cmp')

cmp.setup {
    completion = { completeopt = 'menu,menuone,noinsert' },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping.confirm({ select = false }),
    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }
    }, {
        { name = 'buffer' },
    }),

    formatting = {
        format = lspkind.cmp_format {
            mode = 'symbol_text',
            menu = ({
                nvim_lsp = '[LSP]',
                ultisnips = '[USNIP]',
                nvim_lua = '[LUA]',
                path = '[PATH]',
                emoji = '[EMO]',
                omni = '[OMNI]'
            })
        }
    }
}

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' },
    }, {
        { name = 'buffer' },
    })
})

cmp.event:on(
    'confirm_done',
    ap.on_confirm_done()
)
