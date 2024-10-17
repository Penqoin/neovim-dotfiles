return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip'
    },
    config = function ()
        local cmp = require 'cmp'
        local luasnip = require 'luasnip'

        local cmpSelect = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' }
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping.complete(),
                ["<C-p>"] = cmp.mapping.select_prev_item(cmpSelect),
                ["<Tab>"] = cmp.mapping.select_next_item(cmpSelect),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            })
        })
    end
}

