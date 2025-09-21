return {
    "prichrd/netrw.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("netrw").setup({
            -- Correct way: icons is a table
            icons = {
                enabled = true,      -- show icons
                use_devicons = true, -- requires nvim-web-devicons
            },
            mappings = {             -- ✅ must be a table
                ["l"] = "edit",      -- open file (like VSCode Enter)
                ["h"] = "updir",     -- go up directory
                ["v"] = "vsplit",    -- open in vertical split
                ["s"] = "split",     -- open in horizontal split
                ["t"] = "tabedit",   -- open in new tab
            },
        })
    end
}
