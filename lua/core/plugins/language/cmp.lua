return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "onsails/lspkind.nvim",

        "hrsh7th/cmp-nvim-lsp-signature-help",
        "lukas-reineke/cmp-under-comparator",

        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },

    config = function ()
        local cmp = require "cmp"
        local lspkind = require "lspkind"

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol',
                    maxwidth = {
                        menu = 50,
                        abbr = 50,
                    },
                    ellipsis_char = '...', 
                    show_labelDetails = true,

                    before = function (entry, vim_item)
                    -- ...
                        return vim_item
                    end
                }),
            },

            window = {
                completion = cmp.config.window.bordered(),
            },

            snippet = {
                expand = function (args)
                    require('luasnip').lsp_expand(args.body)
                end
            },

            sources = {
                { name = 'nvim_lsp' },
                { name = "nvim_lsp_signature_help" },
                { name = 'luasnip' },
            },

            mapping = cmp.mapping.preset.insert({
                ['<enter>'] = cmp.mapping.confirm( { select = true } )
            }),
            sorting = {
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    require "cmp-under-comparator".under,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
        })
    end
}
