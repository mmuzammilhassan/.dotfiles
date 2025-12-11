return {
    -- 2. BLADE LSP (HTML/Directives Smarts)
    -- Ensure you installed 'laravel-blade-language-server' via Mason
    -- Point to the binary Mason installed
    cmd = { "laravel-blade-language-server", "--stdio" },
    filetypes = { "blade" },
    settings = {
        blade = {
            tolerance = 10, -- Helps it not crash on incomplete tags
        },
    },
}
