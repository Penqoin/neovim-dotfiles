local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "core.plugins" },
    { import = "core.plugins.tools" },
    { import = "core.plugins.rice" },
    { import = "core.plugins.tools.qualityOfLife" },
    { import = "core.plugins.languages.cmake" }
}, {})
