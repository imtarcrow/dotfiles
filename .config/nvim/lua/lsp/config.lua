-- Setup diagnostic settings
require("lsp.diagnostics")

-- Settings for the Language Servers
require("lsp.rust")

--idk how the fuck this works but gemini generated it for me and it works 
vim.api.nvim_create_autocmd({ "LspAttach", "LspProgress" }, {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client or not client.server_capabilities.inlayHintProvider then
            return
        end

        local bufnr = args.buf

        -- Case 1: The LSP is finished indexing (Great for Rust)
        if args.event == "LspProgress" then
            local value = args.data.params.value
            if value.kind == "end" and (value.title == "Indexing" or value.title == "loading") then
                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end

        -- Case 2: The LSP attached (Backup for everything else)
        elseif args.event == "LspAttach" then
            -- If it's NOT rust-analyzer, just turn it on. 
            -- Other servers (like lua_ls) are usually ready immediately.
            if client.name ~= "rust_analyzer" then
                vim.schedule(function()
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end)
            end
        end
    end,
})
