return {
    {
        'nvim-mini/mini.statusline',
        version = false,
        event = "VeryLazy",
        opts = {
            content = {
                active = function()
                    local mode, mode_hl = MiniStatusline.section_mode({
                        trunc_width = 120,
                    })

                    local filename = MiniStatusline.section_filename({
                        trunc_width = 140,
                    })

                    local location = MiniStatusline.section_location({
                        trunc_width = 75,
                    })

                    ----------------------------------------------------------------
                    -- Macro Recording
                    ----------------------------------------------------------------

                    local macro = ""
                    local reg = vim.fn.reg_recording()

                    if reg ~= "" then
                        macro = "󰑊 @" .. reg
                    end

                    ----------------------------------------------------------------
                    -- Git
                    ----------------------------------------------------------------

                    local git_branch = ""
                    local git_diff = ""

                    local gs = vim.b.gitsigns_status_dict

                    if gs then
                        if (gs.head or "") ~= "" then
                            git_branch = " " .. gs.head
                        end

                        local parts = {}

                        if (gs.added or 0) > 0 then
                            table.insert(parts, "+" .. gs.added)
                        end

                        if (gs.changed or 0) > 0 then
                            table.insert(parts, "~" .. gs.changed)
                        end

                        if (gs.removed or 0) > 0 then
                            table.insert(parts, "-" .. gs.removed)
                        end

                        git_diff = table.concat(parts, " ")
                    end

                    ----------------------------------------------------------------
                    -- Diagnostics
                    ----------------------------------------------------------------

                    local diagnostics = ""

                    local counts = vim.diagnostic.count(0)

                    local errors = counts[vim.diagnostic.severity.ERROR] or 0
                    local warnings = counts[vim.diagnostic.severity.WARN] or 0
                    local info = counts[vim.diagnostic.severity.INFO] or 0
                    local hints = counts[vim.diagnostic.severity.HINT] or 0

                    local diag_parts = {}

                    if errors > 0 then
                        table.insert(diag_parts, "%#DiagnosticError# " .. errors)
                    end

                    if warnings > 0 then
                        table.insert(diag_parts, "%#DiagnosticWarn# " .. warnings)
                    end

                    if info > 0 then
                        table.insert(diag_parts, "%#DiagnosticInfo# " .. info)
                    end

                    if hints > 0 then
                        table.insert(diag_parts, "%#DiagnosticHint#󰌵 " .. hints)
                    end

                    diagnostics = table.concat(diag_parts, " ")

                    ----------------------------------------------------------------
                    -- LSP
                    ----------------------------------------------------------------

                    local lsp_names = ""

                    local clients = vim.lsp.get_clients({
                        bufnr = 0,
                    })

                    if #clients > 0 then
                        local names = {}

                        for _, client in ipairs(clients) do
                            table.insert(names, client.name)
                        end

                        lsp_names = "󰒍 " .. table.concat(names, ", ")
                    end

                    ----------------------------------------------------------------
                    -- Filetype
                    ----------------------------------------------------------------

                    local filetype = vim.bo.filetype


                    ----------------------------------------------------------------
                    -- Filesize
                    ----------------------------------------------------------------

                    local filesize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))

                    if filesize > 0 then
                        filesize = string.format("%.2f KiB", filesize / 1024)
                    else
                        filesize = ""
                    end

                    ----------------------------------------------------------------
                    -- Layout
                    ----------------------------------------------------------------

                    local groups = {
                        {
                            hl = mode_hl,
                            strings = {
                                mode,
                                macro,
                            },
                        },

                        {
                            hl = "MiniStatuslineDevinfo",
                            strings = {
                                git_branch,
                                git_diff,
                            },
                        },

                        {
                            hl = "MiniStatuslineFilename",
                            strings = {
                                filename,
                            },
                        },
                    }

                    if diagnostics ~= "" then
                        table.insert(groups, diagnostics)
                    end

                    table.insert(groups, "%<")
                    table.insert(groups, "%=")

                    if lsp_names ~= "" then
                        table.insert(groups, {
                            hl = "MiniStatuslineFileinfo",
                            strings = {
                                lsp_names,
                            },
                        })
                    end

                    if filetype ~= "" then
                        table.insert(groups, {
                            hl = "MiniStatuslineFileinfo",
                            strings = {
                                filetype,
                            },
                        })
                    end

                    if filesize ~= "" then
                        table.insert(groups, {
                            hl = "MiniStatuslineFileinfo",
                            strings = {
                                filesize
                            }
                        })
                    end

                    table.insert(groups, {
                        hl = mode_hl,
                        strings = {
                            location,
                        },
                    })

                    return MiniStatusline.combine_groups(groups)
                end,

                inactive = function()
                    return MiniStatusline.combine_groups({
                        {
                            hl = "MiniStatuslineFilename",
                            strings = {
                                MiniStatusline.section_filename({}),
                            },
                        },
                    })
                end,
            }
        }
    },
}
