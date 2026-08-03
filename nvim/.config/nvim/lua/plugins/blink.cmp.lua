return {
    {
        "saghen/blink.cmp",
        event = "InsertEnter",
        build = function()
            require('blink.cmp').build():pwait()
        end,
        dependencies = { "saghen/blink.lib", "rafamadriz/friendly-snippets" },
        opts = {
            appearance = {
                nerd_font_variant = "mono",
            },
            completion = {
                documentation = {
                    auto_show = true,
                },
            },
            sources = {
                default = {
                    "lsp",
                    "path",
                    "snippets",
                    "buffer",
                },
            },
            fuzzy = {
                implementation = "prefer_rust_with_warning",
            },
        },
        opts_extend = {
            "sources.default",
        },
    },
}
