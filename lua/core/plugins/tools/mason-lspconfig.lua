return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function () 
        local lspconfig = require('lspconfig')
        local lspCapabilites = require('cmp_nvim_lsp').default_capabilities()
        
        require 'mason-lspconfig'.setup({
            ensure_installed = {
                'lua_ls'
            },
            handlers = {
                function (server)
                    lspconfig[server].setup(lspCapabilites)
                end
            }
        })
    end
}
