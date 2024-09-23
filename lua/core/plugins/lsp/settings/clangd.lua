local nvim_lsp = require('lspconfig')

return {
    cmd = {"clangd"},
    filetypes = {"c", "cpp", "objc", "objcpp"},
    root_dir = nvim_lsp.util.root_pattern("compile_commands.json", "~/compilers/compile_flags.txt", ".git"),
}

