return {
    { -- This helps with ssh tunneling and copying to clipboard
        'ojroques/vim-oscyank',
    },
    { -- Git plugin
        'tpope/vim-fugitive',
    },
    { -- Show CSS Colors
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup({})
        end
    },
    {
        "mbbill/undotree",
        config = function()
            -- Optional: map a key to toggle it easily
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })
        end,
    }
}
