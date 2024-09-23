return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        'mfussenegger/nvim-dap',
        'nvim-neotest/nvim-nio',
        'folke/neodev.nvim'
    },
    config = function ()
        local dap = require('dap')

        dap.configurations.cpp = {
            name = 'Launch',
            type = 'lldb',
            rqeuest = 'launch',
            program = function ()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {},
        }

        dap.configurations.python = {
            {
                type = 'python'; 
                request = 'launch';
                name = "Launch file";


                program = "${file}"; -- This configuration will launch the current file if used.
                pythonPath = function()
                    local cwd = vim.fn.getcwd()
                    if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                        return cwd .. '/venv/bin/python'
                    elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                        return cwd .. '/.venv/bin/python'
                    else
                        return '/usr/bin/python'
                    end
                end;
                },
            }

            -- debugger ui 
            require('neodev').setup({
                library = { plugins = { "nvim-dap-ui" }, types = true}
            })
    end
}
