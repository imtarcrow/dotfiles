return {
    {
        "saghen/blink.indent",
        event = { "BufReadPost", "BufNewFile" },

        opts = {
            static = {
                char = "┆"
            },
            scope = {
                enabled = false,
            }
        }
    },
}
