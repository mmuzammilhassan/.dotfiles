-- Modern, lazy-loaded LSP setup
-- Goal: minimal startup cost, servers load only when needed

-- Lazy-load diagnostics config (applies only when LSP attaches)
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN]  = "",
                    [vim.diagnostic.severity.HINT]  = "",
                    [vim.diagnostic.severity.INFO]  = "",
                },
            },
            --virtual_text = true,
            virtual_text = {
                prefix = function(diagnostic)
                    local icons = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN]  = "",
                        [vim.diagnostic.severity.HINT]  = "",
                        [vim.diagnostic.severity.INFO]  = "",
                    }
                    return icons[diagnostic.severity] or "●"
                end,
                spacing = 4, -- Optional: space between icon and text
            },
            underline = true,
            update_in_insert = true,
            severity_sort = true,
        })

        -- Keymaps only set when LSP is attached
        local opts = { buffer = event.buf }
        --      How to come back
        --      Vim has a built-in jump list. After gd, just press:
        --      <C-o> → go back
        --      <C-i> → go forward
        --      That’s the "toggle-like" navigation for all jumps (gd, :tag, /search, etc.).
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)

        -- Diagnostics (stay minimal)
        vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
        vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

-- ========================
-- Capabilities for nvim-cmp
-- ========================
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Define LSP server configs (low-level API)
local servers = {
    intelephense = {
        filetypes = { "php" },
        cmd = { "intelephense", "--stdio" },
        root_dir = function(fname)
            return vim.fs.root(fname, { "composer.json", ".git" })
        end,
        settings = {
            intelephense = {
                environment = {
                    phpVersion = "8.4",
                },
            },
        },
    },

    lua_ls = {
        filetypes = { "lua" },
        cmd = { "lua-language-server" },
        root_dir = function(fname)
            return vim.fs.root(fname, { ".git", ".luarc.json", })
        end,
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
            },
        },
    },

    ts_ls = {
        filetypes = { "vue", "javascript", "typescript", "typescriptreact" },
        cmd = { "typescript-language-server", "--stdio" },
        root_dir = function(fname)
            return vim.fs.root(fname, { ".git", "package.json", }) or vim.fn.getcwd()
        end,
    },

--    vue_ls = {
--        filetypes = { "vue", "javascript" },
--        cmd = { "vue-language-server", "--stdio" },
--        root_dir = function(fname)
--            return vim.fs.root(fname, { ".git", "package.json", }) or vim.fn.getcwd()
--        end,
--    },

    html = {
        filetypes = { "html" },
        cmd = { "vscode-html-language-server", "--stdio" },
        root_dir = function(fname)
            return vim.fs.root(fname, { ".git", "package.json", }) or vim.fn.getcwd()
        end,
    },

    cssls = {
        filetypes = { "css", "scss", "less" },
        cmd = { "vscode-css-language-server", "--stdio" },
        root_dir = function(fname)
            return vim.fs.root(fname, { ".git", "package.json", }) or vim.fn.getcwd()
        end,
    },

    --twiggy_language_server = {
    --    filetypes = { "twig" },
    --    cmd = { "twiggy-language-server", "--stdio" },
    --    root_dir = function(fname)
    --        return vim.fs.root(fname, {
    --            ".git",
    --            "composer.json",
    --            "symfony.lock",
    --            "package.json",
    --        }) or vim.fn.getcwd()
    --    end,
    --    settings = {
    --        twiggy = {
    --            framework = "generic",   -- "symfony" if you’re in Symfony project
    --            phpExecutable = "/usr/bin/php",
    --            symfonyConsolePath = "", -- set empty string instead of nil
    --            diagnostics = {
    --                twigCsFixer = false, -- avoids null crash
    --            },
    --        },
    --    },
    --},

    emmet_ls = {
        -- filetypes = { "html", "twig" },
        filetypes = { "twig", },
        cmd = { "emmet-ls", "--stdio" },
        root_dir = function(fname)
            return vim.fs.root(fname, { ".git" })
        end,
    },

    tailwindcss = {
        filetypes = { "html" },
        cmd = { "tailwindcss-language-server", "--stdio" },
        --        root_dir = function(fname)
        --            return vim.fs.root(fname, {
        --                ".git",
        --                "tailwind.config.js",
        --                "tailwind.config.ts",
        --                "postcss.config.js",
        --                "package.json",
        --            })
        --        end,
    },
}

-- Register configs and start servers on demand
for name, config in pairs(servers) do
    vim.lsp.config[name] = vim.tbl_extend("force", config, {
        capabilities = capabilities,
    })

    -- Lazy-load: start only when matching filetype opens
    vim.api.nvim_create_autocmd("FileType", {
        pattern = config.filetypes,
        callback = function(args)
            vim.lsp.start(vim.lsp.config[name], { bufnr = args.buf })
        end,
    })
end

-- Mason setup (still works fine for binaries)
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = true,
})
