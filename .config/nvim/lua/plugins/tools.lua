return {
    {
        'stevearc/oil.nvim',
        lazy = false,
        opts = {
            default_file_explorer = true,
            columns = {
                'icon',
                'permissions',
                'size',
                'mtime',
            },
            cleanup_delay_ms = 100,
            lsp_file_methods = {
                enabled = true,
                timeout_ms = 100,
                autosave_changes = true,
            },
            watch_for_changes = true,
            view_options = {
                show_hidden = true,
                natural_order = "fast",
            }
        },
        keys = {
            { '<leader>e', '<CMD>Oil<CR>', desc = 'Open the Oil File Manager' },
        }
    },

    {
        'nvim-telescope/telescope.nvim',
        lazy = true,
        dependencies = {
            { 'nvim-tree/nvim-web-devicons' },
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install' }
        },
        opts = {
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                }
            }
        },
        keys = {
            { '<leader>ff', '<CMD>Telescope find_files<CR>', desc = "Find Files" },
            { '<leader>fg', '<cmd>Telescope live_grep<cr>',  desc = "Live Grep" },
            { '<leader>fb', '<cmd>Telescope buffers<cr>',    desc = "Buffers" },
            { '<leader>fs', '<cmd>Telescope treesitter<cr>', desc = "Treesitter Symbols" }, },
        config = function()
            require('telescope').load_extension('fzf')
        end
    },
}
