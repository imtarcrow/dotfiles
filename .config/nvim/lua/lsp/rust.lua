vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy",
            },

            diagnostics = {
                enable = true,
            },

            procMacro = {
                enable = true,
            },

            cargo = {
                buildScripts = { enable = true },
                features = "all",
            },

            inlayHints = {
                enable = true,
                typeHints = {
                    enable = true,
                    hideClosureInitialization = false,
                    hideNamedConstructor = false,
                },
                parameterHints = { enable = true },
                chainingHints = { enable = true },
                closureReturnTypeHints = { enable = "always" },
                lifetimeElisionHints = {
                    enable = "always",
                    useParameterNames = true,
                },
                bindingModeHints = { enable = true },
                discriminantHints = { enable = "always" },
                rangeExclusiveHints = { enable = true },
            },

            completion = {
                autoimport = { enable = true },
                autoself = { enable = true },
                postfix = { enable = true },
            },

            imports = {
                granularity = { group = "module" },
                prefix = "self",
            },

            hover = {
                actions = {
                    enable = true,
                    run = { enable = true },
                    debug = { enable = true },
                    gotoTypeDef = { enable = true },
                    implementations = { enable = true },
                    references = { enable = true },
                },
                documentation = { enable = true },
                links = { enable = true },
            },
        },
    },
})

vim.lsp.enable("rust_analyzer")
