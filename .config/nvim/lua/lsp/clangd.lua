vim.lsp.config("clangd", {
    cmd = { "clangd" },
    filetypes = { "c", "cpp" },
    root_markers = { "compile_commands.json", ".git" },
})

vim.lsp.enable("clangd")
