local blink = require("blink.cmp")

return {
    cmd = { "twiggy", "--stdio" },
    filetypes = { "twig" },
    root_dir = function(fname)
        return require("lspconfig.util").root_pattern("composer.json", ".git")(fname)
    end,
    settings = {},
    -- Optional: integrate blink if needed
    capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        require("blink.cmp").get_lsp_capabilities()
    ),
}
