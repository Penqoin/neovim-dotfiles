return {
    "nvim-tree/nvim-tree.lua",
    config = function ()
        require "nvim-tree".setup({})

        local api = require 'nvim-tree.api'
        vim.keymap.set('n', '<Leader> ', api.tree.open)
        vim.keymap.set('n', '<Leader>r', api.tree.reload)
    end
}
