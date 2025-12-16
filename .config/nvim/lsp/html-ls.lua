return {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = {
        "html",
        "blade",
        "javascriptreact",
        "typescriptreact",
        "svelte",
    },
    init_options = {
        configurationSection = { "blade", "html", "css", "javascript" },
        embeddedLanguages = {
            css = true,
            javascript = true
        },
        provideFormatter = true,
        dataPaths = {
            -- ABSOLUTE PATH to the file you just created
            vim.fn.stdpath("config") .. "/alpine-data.json",
        },
        root_markers = { "index.html", ".git" },
        init_options = { provideFormatter = true },
    }
}
