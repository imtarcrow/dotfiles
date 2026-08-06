local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("clangd", {
    capabilities = capabilities,

    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
        "--pch-storage=memory",
        "--all-scopes-completion",
        "--cross-file-rename",
        "--function-arg-placeholders",
    },
})

vim.lsp.enable("clangd")
