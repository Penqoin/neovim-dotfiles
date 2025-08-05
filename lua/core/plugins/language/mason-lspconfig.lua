return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp"
    },

    config = function ()
        local masonLSP = require("mason-lspconfig")
        local lspconfig = require "lspconfig"

        masonLSP.setup({
            automatic_installation = true,
            ensure_installed = { "lua_ls" } -- Add other servers as needed
        })
    end
}


