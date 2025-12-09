return {
    cmd = { "vscode-blade-language-server", "--stdio" },
    filetypes = { "blade", "php", "less" },
    root_markers = { "package.json", ".git" },
    settings = {
        css = { validate = true },
        scss = { validate = true },
        less = { validate = true },
    },
}

return {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php", "blade" },
    root_markers = { "composer.json", ".git" },
    -- init_options = {
    --     licenceKey = get_intelephense_license(),
    -- },
}

