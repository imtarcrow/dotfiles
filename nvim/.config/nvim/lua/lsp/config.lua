vim.diagnostic.config({
    virtual_text = {
        current_line = true,
    },
    severity_sort = true,
    signs = true,
    underline = true,
    update_in_insert = false,
})

-- Settings for the Language Servers
require("lsp.rust_analyzer")
require("lsp.clangd")
require("lsp.lua_ls")
require("lsp.glsl_analyzer")
