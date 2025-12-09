return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        -- 1. DEFINE CUSTOM DDEV PINT LINTER
        -- This tells nvim to run pint inside the container
        lint.linters.ddev_pint = {
            cmd = "ddev",
            stdin = false,
            -- We run 'exec' to run it inside the container
            args = { "exec", "./vendor/bin/pint", "--test" },
            stream = "stdout",      -- Pint usually outputs standard text
            ignore_exitcode = true, -- Pint returns exit code 1 if style issues are found
            parser = function(output, bufnr)
                local diagnostics = {}

                if not output or output == "" then
                    return diagnostics
                end

                -- Simple parser: If Pint complains, show a warning at the top of the file
                -- because Pint modifies files, it doesn't always give exact line numbers easily in --test mode
                if string.find(output, "FAIL") or string.find(output, "style issues") then
                    table.insert(diagnostics, {
                        lnum = 0,
                        col = 0,
                        message = "Code style issues found. Save file to auto-fix.",
                        severity = vim.diagnostic.severity.WARN,
                        source = "Laravel Pint (DDEV)",
                    })
                end

                return diagnostics
            end,
        }

        -- 2. CONFIGURE LINTERS BY FILETYPE
        lint.linters_by_ft = {
            -- Go
            go = { "golangcilint" },

            -- JS/TS
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescriptreact = { "eslint_d" },

            -- Lua
            lua = { "luacheck" },

            -- Shell
            sh = { "shellcheck" },
            bash = { "shellcheck" },
            zsh = { "shellcheck" },

            -- PHP (The important part!)
            php = { "ddev_pint" },

            -- Twig
            twiggy = { "twiggy" },
            -- python = { "flake8", "mypy" },
            -- rust = { "clippy" },
        }

        -- 3. AUTO-LINT ON EVENTS
        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                local linters = lint.linters_by_ft[vim.bo.filetype]
                if linters and #linters > 0 then
                    lint.try_lint()
                end
            end,
        })

        -- 4. KEYMAPS & DEBUGGING
        vim.keymap.set("n", "<leader>ll", function()
            lint.try_lint()
            vim.notify("Linting...", vim.log.levels.INFO, { title = "nvim-lint" })
        end, { desc = "Trigger linting for current file" })

        vim.keymap.set("n", "<leader>li", function()
            local linters = lint.linters_by_ft[vim.bo.filetype] or {}
            if #linters == 0 then
                print("No linters configured for filetype: " .. vim.bo.filetype)
            else
                print("Linters for " .. vim.bo.filetype .. ": " .. table.concat(linters, ", "))

                -- Check PHP specific status
                if vim.bo.filetype == "php" then
                    print("Using DDEV-based Pint (Containerized)")
                end
            end
        end, { desc = "Show available linters" })
    end,
}
