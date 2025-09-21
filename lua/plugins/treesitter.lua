return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        -- parsers you want installed
        ensure_installed = {
          "lua", "vim", "vimdoc", "query", -- Neovim stuff
          "c", "cpp", "python", "javascript", "html", "css", "json",
        },

        sync_install = false,    -- install parsers asynchronously
        auto_install = true,     -- auto install missing parsers when opening a buffer
        highlight = {
          enable = true,         -- enable highlighting
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true }, -- optional, for better indentation
      })
    end,
  },
}

