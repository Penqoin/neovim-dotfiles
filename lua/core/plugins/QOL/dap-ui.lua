return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
    },
    config = function ()
        local dap = require "dap"
        local ui = require "dapui"

        ui.setup()

        -- globals -- 
        vim.keymap.set("n", "<leader>du", ui.toggle)
        vim.keymap.set("n", "<leader>bb", dap.toggle_breakpoint)
    end
}
