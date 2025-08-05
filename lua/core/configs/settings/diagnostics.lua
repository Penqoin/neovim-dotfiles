vim.diagnostic.enable = true
vim.diagnostic.config({
    virtual_text = {
        prefix = '●',  -- You can customize the prefix here
        spacing = 4,   -- Adjust spacing between the prefix and the message
    },
    severity_sort = true
})
