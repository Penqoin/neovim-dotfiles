return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function ()
        local api = require "nvim-tree.api"

        local function myAttach(bufnr)
            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom keymaps
            vim.keymap.set('n', "ee", api.node.open.edit , opts("open"))
            vim.keymap.set('n', "pp", api.node.open.preview , opts("open preview"))
        end


        -- global mappings 
        vim.keymap.set("n", "qq", function ()
            api.tree.toggle()
        end)

        require("nvim-tree").setup({
            on_attach = myAttach
        })
    end
}

