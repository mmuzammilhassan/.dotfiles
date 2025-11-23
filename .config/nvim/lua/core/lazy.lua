local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = { lazy = true },
  checker = { enabled = false },
  ui = { border = "rounded" },
  performance = {
    cache = { enabled = true },
    rtp = {
      disabled_plugins = {
        "netrwPlugin",
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

    --    -- DAP FOR PHP
    --    {
    --        "rcarriga/nvim-dap-ui",
    --        dependencies = {
    --            "mfussenegger/nvim-dap",
    --            "theHamsta/nvim-dap-virtual-text",
    --            "nvim-neotest/nvim-nio", -- 🔥 this is what’s missing
    --        },
    --        config = function()
    --            local dap = require("dap")
    --            local dapui = require("dapui")
    --
    --            dapui.setup()
    --            require("nvim-dap-virtual-text").setup()
    --
    --            dap.listeners.after.event_initialized["dapui_config"] = function()
    --                dapui.open()
    --            end
    --            dap.listeners.before.event_terminated["dapui_config"] = function()
    --                dapui.close()
    --            end
    --            dap.listeners.before.event_exited["dapui_config"] = function()
    --                dapui.close()
    --            end
    --        end,
    --    },


    -- FOR LARAVEL

    --{
    --    "adalessa/laravel.nvim",
    --    dependencies = {
    --        "tpope/vim-dotenv",
    --        "MunifTanjim/nui.nvim",
    --        "nvim-lua/plenary.nvim",
    --        "nvim-neotest/nvim-nio",
    --        "ravitemer/mcphub.nvim", -- optional
    --    },
    --    cmd = { "Laravel" },
    --    event = { "VeryLazy" },
    --    opts = {
    --        lsp_server = "intelephense", -- or "phpactor"
    --        features = {
    --            pickers = {
    --                provider = "fzf-lua", -- or "snacks", "telescope", "ui-select"
    --            },
    --        },
    --    },
    --    config = function(_, opts)
    --        local Laravel = require("laravel")
    --        Laravel.setup(opts)
    --        ...
    --    end,
    --}

    -- Optional (commented out)
    -- { "nvim-treesitter/playground", enabled = false },
    -- { "tpope/vim-fugitive", enabled = false },
    --{ "christoomey/vim-tmux-navigator", enabled = false },
    -- { "wakatime/vim-wakatime", enabled = false },
    -- { "kdheepak/lazygit.nvim", enabled = false },
    -- {
    --   "m4xshen/hardtime.nvim",
    --   version = "v1.0.0",
    --   dependencies = { "MunifTanjim/nui.nvim" },
    --   enabled = false,
    -- },


