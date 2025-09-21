return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')

        -- Create custom highlight groups for colors
        vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#61afef', bold = true })
        vim.api.nvim_set_hl(0, 'DashboardName', { fg = '#e06c75', bold = true })
        vim.api.nvim_set_hl(0, 'DashboardGreeting', { fg = '#98c379', italic = true })
        vim.api.nvim_set_hl(0, 'DashboardKey', { fg = '#e5c07b', bold = true })
        vim.api.nvim_set_hl(0, 'DashboardDesc', { fg = '#abb2bf' })
        vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#56b6c2' })

        dashboard.section.header.val = {
            '',
            '    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
            '    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
            '    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
            '    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
            '    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
            '    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
            '',
            '                   mohit-kumar168',
            '           🚀 Welcome back, Developer! 👨‍💻',
            '               2025-09-10 09:41:08 UTC',
            '',
        }

        dashboard.section.buttons.val = {
            dashboard.button("f", "🔍  Find Files", ":Telescope find_files<CR>"),
            dashboard.button("r", "📄  Recent Files", ":Telescope oldfiles<CR>"),
            dashboard.button("w", "🔎  Find Word", ":Telescope live_grep<CR>"),
            dashboard.button("q", "🚪  Quit Neovim", ":qa<CR>"),
        }

        dashboard.section.footer.val = {
            '╭───────────────────────────────────────────────────────────╮',
            '│  🎯 5 Active Repositories • Full Stack Developer          │',
            '│                                                           │',
            '│  🔗 github.com/mohit-kumar168                             │',
            '│                                                           │',
            '│  💻 "The best way to predict the future is to create it"  │',
            '╰───────────────────────────────────────────────────────────╯',
            '',
            '              🚀 Keep coding, keep growing! 💪',
            ''
        }

        -- Apply custom colors
        dashboard.section.header.opts.hl = "DashboardHeader"
        dashboard.section.buttons.opts.hl = "DashboardDesc"
        dashboard.section.footer.opts.hl = "DashboardFooter"

        -- Custom layout for perfect centering
        dashboard.opts.layout = {
            { type = "padding", val = 1 },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
            { type = "padding", val = 2 },
            dashboard.section.footer,
            { type = "padding", val = 1 },
        }

        alpha.setup(dashboard.opts)

        -- Disable horizontal scrolling but allow vertical
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "alpha",
            callback = function()
                -- Center everything and disable horizontal scroll
                vim.opt_local.wrap = false
                vim.opt_local.sidescrolloff = 0
                vim.opt_local.scrolloff = 8

                -- Clean UI
                vim.opt_local.number = false
                vim.opt_local.relativenumber = false
                vim.opt_local.cursorline = false
                vim.opt_local.signcolumn = "no"
                vim.opt_local.foldcolumn = "0"

                -- Disable horizontal scrolling but keep vertical
                vim.keymap.set('n', '<Left>', '<Nop>', { buffer = true })
                vim.keymap.set('n', '<Right>', '<Nop>', { buffer = true })
                vim.keymap.set('n', '<S-Left>', '<Nop>', { buffer = true })
                vim.keymap.set('n', '<S-Right>', '<Nop>', { buffer = true })
                vim.keymap.set('n', 'zh', '<Nop>', { buffer = true })
                vim.keymap.set('n', 'zl', '<Nop>', { buffer = true })
                vim.keymap.set('n', 'zH', '<Nop>', { buffer = true })
                vim.keymap.set('n', 'zL', '<Nop>', { buffer = true })
            end
        })

        -- Auto-update package count dynamically
        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local package_count = stats.loaded
                dashboard.section.footer.val[2] = string.format(
                    '│  📦 %d Packages Loaded • neovim loaded successfully      │',
                    package_count
                )
                alpha.redraw()
            end,
        })
    end,
}
