return {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap"
    },

    config = function ()
        local dap = require "mason-nvim-dap"

        dap.setup({
            handlers = {
                function (cfg)
                    dap.default_setup(cfg)
                end
            },
            cpp = function (cfg)
                cfg.adapters = {
                    type = "executable",
                    port = 13000,
                    executable = {
                        command = vim.fn.stdpath('data') .. "/mason/bin/codelldb",
                        args = { "--port", "13000" }
                    }
                }

                dap.default_setup(cfg)
            end
        })
    end
}
