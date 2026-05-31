vim.lsp.config("glsl_analyzer", {
    cmd = { "glsl_analyzer" },
    filetypes = {
        "glsl",
        "vert",
        "frag",
        "geom",
        "tesc",
        "tese",
        "comp",
    },
    root_markers = { ".git" },
    settings = {
        glsl_analyzer = {
            diagnostics = {
                enable = true,
            },
        },
    },
})
vim.lsp.enable("glsl_analyzer")
