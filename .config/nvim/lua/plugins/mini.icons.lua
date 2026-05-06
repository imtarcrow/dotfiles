return {
    {
        "nvim-mini/mini.icons",
        lazy = true,
        opts = {},
        config = function(_, opts)
            require("mini.icons").setup(opts)
            require("mini.icons").mock_nvim_web_devicons()
        end,
    },
}
