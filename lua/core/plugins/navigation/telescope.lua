return {
    "nvim-telescope/telescope.nvim",
    config = function ()
        local builtin = require "telescope.builtin"
        local actions = require "telescope.actions"

        -- global --
        vim.keymap.set('n', 'ff', builtin.find_files)
        vim.keymap.set('n', 'fg', builtin.live_grep)
        vim.keymap.set('n', 'fc', builtin.current_buffer_fuzzy_find)

        require("telescope").setup({})
    end
}
