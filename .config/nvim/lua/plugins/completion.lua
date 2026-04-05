return {
    {
        'saghen/blink.cmp',
        lazy = false,
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        opts = {
            appearance = {
                nerd_font_variant = 'mono'
            },
            completion = {
                documentation = {
                    auto_show = true,
                },
            },
            sources = {
                default = {
                    'lsp',
                    'path',
                    'snippets',
                    'buffer'
                },
            },
            fuzzy = {
                implementation = "prefer_rust_with_warning",
            },
            signature = { enabled = true, window = { show_documentation = false } }
        },
        opts_extend = {
            "sources.default",
        }
    }
}
