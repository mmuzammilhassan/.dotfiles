return {
    cmd = { "laravel-blade-language-server", "--stdio" },
    filetypes = { "blade" },
    root_markers = { "composer.json", ".git" },
    settings = {
        blade = {
            tolerance = 10, -- Helps it not crash on incomplete tags
        },
    },
}
