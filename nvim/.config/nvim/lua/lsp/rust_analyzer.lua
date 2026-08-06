local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,

    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy",
            },

            cargo = {
                features = "all",
            },

            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },

            inlayHints = {
                closureReturnTypeHints = {
                    enable = "always",
                },
                lifetimeElisionHints = {
                    enable = "always",
                    useParameterNames = true,
                },
                discriminantHints = {
                    enable = "always",
                },
            },
        },
    },
})

vim.lsp.enable("rust_analyzer")
