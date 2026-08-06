local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("glsl_analyzer", {
    capabilities = capabilities,
})

vim.lsp.enable("glsl_analyzer")
