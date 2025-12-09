return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true }, function(err, did_edit)
                    if not err and did_edit then
                        vim.notify("Code formatted", vim.log.levels.INFO, { title = "Conform" })
                    end
                end)
            end,
            mode = { "n", "v" },
            desc = "Format buffer",
        },
    },

    formatters = {
        -- Define a custom formatter that runs Pint inside DDEV
        ddev_pint = {
            command = "ddev",
            args = { "exec", "./vendor/bin/pint", "$FILENAME" },
            stdin = false, -- Pint modifies the file in place
        },
    },
    opts = {
        formatters_by_ft = {
            -- Go
            go = { "goimports", "gofmt" },

            -- Lua
            lua = { "stylua" },

            -- Web technologies
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            json = { "prettier" },
            jsonc = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },

            -- Python
            python = { "isort", "black" },

            -- PHP/Laravel
            --php = { "pint" },
            php = { "ddev_pint" },
            -- Blade uses blade-formatter (Local Node tool - fast & pretty)
            blade = { "blade-formatter" },

            -- Shell
            sh = { "shfmt" },
            bash = { "shfmt" },

            -- Other (system tools)
            rust = { "rustfmt" }, -- comes with Rust installation

            -- Additional file types (uncomment as needed)
            -- markdown = { "markdownlint" },
            -- yaml = { "yamllint" },
            -- toml = { "taplo" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
        -- format_on_save = {
        --     timeout_ms = 1000,
        --     lsp_format = "fallback",
        -- },

    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
