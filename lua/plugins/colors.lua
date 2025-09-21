return {
    --[[{
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "moon",     -- try "moon" if you want softer purple
            transparent = true, -- let terminal background show
        },
        config = function(_, opts)
            vim.opt.termguicolors = true
            require("tokyonight").setup(opts)
            vim.cmd.colorscheme("tokyonight")
        end,
    },]]
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                disable_background = true,
                disable_float_background = true,
            })

            vim.cmd("colorscheme rose-pine")
        end
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "rose-pine",
            },
            sections = {
                lualine_z = {
                    function()
                        return "mohit"
                    end,
                },
            },
        },
    },
}
