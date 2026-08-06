local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("lua_ls", {
    capabilities = capabilities,

    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            },

            workspace = {
                checkThirdParty = false,
            },

            telemetry = {
                enable = false,
            },
        },
    },
})

vim.lsp.enable("lua_ls")
