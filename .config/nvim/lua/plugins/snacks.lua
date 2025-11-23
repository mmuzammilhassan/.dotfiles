return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false, -- loads immediately, but still lightweight
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        explorer = {
            enabled = true,
            icons = true,
        },
        input = { enabled = true },
        notifier = {
            enabled = true,
            top_down = false, -- grow notifications upward (like nvim-notify)
            max_width = 60,
            timeout = 3000, -- ms
        },
        dashboard = {
            preset = {
                --Welcome back, Zephyr
                -- ____   ____   ____   _   _   _  _   ____
                --(_   ) ( ___) (  _ \ ( )_( ) ( \/ ) (  _ \
                -- / /_   )__)   )___/  ) _ (   \  /   )   /
                --(____) (____) (__)   (_) (_)  (__)  (_)\_)]],
                header =
[[____  ____  ____  _   _  _  _  ____
(_   )( ___)(  _ \( )_( )( \/ )(  _ \
 / /_  )__)  )___/ ) _ (  \  /  )   /
(____)(____)(__)  (_) (_) (__) (_)\_)

https://github.com/mmuzammilhassan]],
            },
            sections = {
                { section = "header" },
                { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
                { icon = " ", title = "Recent Files", limit = 9, section = "recent_files", indent = 2, padding = 1 },
               -- { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                { icon = "󰾆 ", section = "startup" },
            },
        },
    },
    picker = {
        sources = {
            files = { hidden = true }, -- show hidden files
            grep = { hidden = true },  -- search hidden files too
        },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        styles = {
            notification = {
                -- wo = { wrap = true } -- Wrap notifications
            },
        },
        win = {
            input = {
                keys = {
                    ["<Tab>"] = { "list_down", mode = { "i", "n" } },
                    ["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
                },
            },
        },
    },
    config = function(_, opts)
        require("snacks").setup(opts)
        -- Make Snacks the default notify system
        vim.notify = require("snacks").notifier.notify
    end,
    keys = function()
        local Snacks = require("snacks")
        return {

            -- TOP PICKERS & EXPLORER
            { "<leader>se",      function() Snacks.picker.spelling() end,        desc = "spelling" },
            { "<leader><space>", function() Snacks.picker.smart() end,           desc = "Smart Find Files" },
            { "<leader>,",       function() Snacks.picker.buffers() end,         desc = "Buffers" },
            { "<leader>/",       function() Snacks.picker.grep() end,            desc = "Grep" },
            { "<leader>:",       function() Snacks.picker.command_history() end, desc = "Command History" },
            --          { "<leader>n",       function() Snacks.picker.notifications() end,                           desc = "Notification History" },
            --            { "<leader>e",       function() Snacks.explorer() end,                                       desc = "File Explorer" },

            -- FIND
            --            { "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
                { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
            { "<leader>ff", function() Snacks.picker.files() end,                 desc = "Find Files" },
            { "<leader>fg", function() Snacks.picker.git_files() end,             desc = "Find Git Files" },
            { "<leader>fp", function() Snacks.picker.projects() end,              desc = "Projects" },
            { "<leader>fr", function() Snacks.picker.recent() end,                desc = "Recent" },

            -- git
            --            { "<leader>gb",      function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
            --            { "<leader>gl",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
            --            { "<leader>gL",      function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
            --            { "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
            --            { "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
            --            { "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
            --            { "<leader>gf",      function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },

            -- Grep  -- for grep makesure ripgrep is install locally
            --            { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
            --            { "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
            { "<leader>sg", function() Snacks.picker.grep() end,                  desc = "Grep" },
            --            { "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },

            -- SEARCH
            --            { '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
            { '<leader>s/', function() Snacks.picker.search_history() end,        desc = "Search History" },
            --            { "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
            --            { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
            { "<leader>sc", function() Snacks.picker.command_history() end,       desc = "Command History" },
            --            { "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
            --            { "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
            --            { "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
            { "<leader>sh", function() Snacks.picker.help() end,                  desc = "Help Pages" },
            --            { "<leader>sH",      function() Snacks.picker.highlights() end,                              desc = "Highlights" },
            { "<leader>si", function() Snacks.picker.icons() end,                 desc = "Icons" },
            --            { "<leader>sj",      function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
            { "<leader>sk", function() Snacks.picker.keymaps() end,               desc = "Keymaps" },
            --            { "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
            --            { "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
            { "<leader>sM", function() Snacks.picker.man() end,                   desc = "Man Pages" },
            --            { "<leader>sp",      function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
            --            { "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
            { "<leader>sR", function() Snacks.picker.resume() end,                desc = "Resume" },
            { "<leader>su", function() Snacks.picker.undo() end,                  desc = "Undo History" },
            { "<leader>uC", function() Snacks.picker.colorschemes() end,          desc = "Colorschemes" },

            -- LSP
            { "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
            { "gD",         function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration" },
            { "gr",         function() Snacks.picker.lsp_references() end,        nowait = true,                  desc = "References" },
            { "gI",         function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
            { "gy",         function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
            { "<leader>ss", function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
            { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

            -- Other
            { "<leader>z",  function() Snacks.zen() end,                          desc = "Toggle Zen Mode", },
            { "<leader>Z",  function() Snacks.zen.zoom() end,                     desc = "Toggle Zoom", },
        }
    end,
}
