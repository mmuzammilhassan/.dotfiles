return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
--  branch = main,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      preset = {
        --Welcome back, Zephyr
        --  https://github.com/mmuzammilhassan
        header =
[[░▀▀█░█▀▀░█▀█░█░█░█░█░█▀▄
░▄▀░░█▀▀░█▀▀░█▀█░░█░░█▀▄
░▀▀▀░▀▀▀░▀░░░▀░▀░░▀░░▀░▀

POWER BELONGS TO THOSE WHO TAKE IT
 https://github.com/mmuzammilhassan]],
      },
      sections = {
        { section = "header" },
        { section = "keys", gap= 0, padding = 1 },
--         -- index_keys = { "1", "2", "3", "4", "7", "8", "9", "0" },
--         -- { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
--         -- { icon = " ", title = "Recent Files", limit = 4, section = "recent_files", indent = 2, padding = 1 },
--         -- { icon = " ", title = "Projects", limit = 4, section = "projects", indent = 2, padding = 1 },
        { icon = "󰾆 ", section = "startup" },
      },
    },
    indent = { enabled = false },
    input = { enabled = true },

    notifier = {
      -- max_width = 60,
      top_down = false, -- grow notifications upward (like nvim-notify)
      enabled = true,
      timeout = 3000,
    },

    -- explorer
    picker = {
      enabled = true,
      sources = {
        files = { hidden = true },
        grep = { hidden = true },
        explorer = {
          auto_close = true,
          -- Your Explorer Config (Correctly setup now)
          layout = {
            preset = "sidebar",
            layout = {
              -- position = "right",
              position = "float",
              -- backdrop = false,
              -- width = 40,
            },
          },
        },
      },
      -- 2. "win" must be inside "picker" to control picker keymaps
      win = {
        input = {
          keys = {
            ["<Tab>"] = { "list_down", mode = { "i", "n" } },
            ["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
          },
        },
      },
    },

    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      },
    },
  },
  keys = {
    -- TOP PICKERS & EXPLORER
    { "<leader>se",      function() Snacks.picker.spelling() end,                                desc = "spelling" },
    -- In your keys table
    { "<leader><space>", function() Snacks.picker.smart({ filter = { cwd = true } }) end, desc = "Smart Find Files (CWD Only)" },
    -- { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
    { "<leader>,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
    { "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
    --          { "<leader>n",       function() Snacks.picker.notifications() end,                           desc = "Notification History" },
    { "<leader>e",       function() Snacks.picker.explorer() end,                                desc = "File Explorer (Float/Auto Close)" },
    -- { "<leader>e", function() Snacks.picker.explorer({ layout = { preset = "sidebar", position = "right" }, auto_close = true }) end, desc = "File Explorer (Auto-Close)" },
    -- vim.keymap.set("n", "<leader>e", function() require("snacks").picker.explorer({ layout = "float" }) end, { desc = "Snacks Explorer (Float)" })

    -- FIND
    -- { "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    -- { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
    { "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
    -- { "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
    -- { "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },

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
    { "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
    --            { "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },

    -- SEARCH
    --            { '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
    { '<leader>s/',      function() Snacks.picker.search_history() end,                          desc = "Search History" },
    --            { "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
    --            { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
    { "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
    --            { "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
    --            { "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
    --            { "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
    { "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
    --            { "<leader>sH",      function() Snacks.picker.highlights() end,                              desc = "Highlights" },
    { "<leader>si",      function() Snacks.picker.icons() end,                                   desc = "Icons" },
    -- { "<leader>sj", function() Snacks.picker.jumps() end,                 desc = "Jumps" },

    { "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
    --            { "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
    --            { "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
    { "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
    --            { "<leader>sp",      function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
    --            { "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
    { "<leader>sR",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
    { "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undo History" },
    { "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },

    -- LSP
    { "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
    { "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
    { "gr",              function() Snacks.picker.lsp_references() end,                          nowait = true,                  desc = "References" },
    { "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
    { "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
    { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
    { "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },

    -- Other
    { "<leader>z",       function() Snacks.zen() end,                                            desc = "Toggle Zen Mode", },
    { "<leader>Z",       function() Snacks.zen.zoom() end,                                       desc = "Toggle Zoom", },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle
            .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
            :map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,
}
