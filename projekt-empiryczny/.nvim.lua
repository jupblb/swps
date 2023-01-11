local lspconfig = require('lspconfig')

lspconfig.pyright.setup({})
lspconfig.ruff_lsp.setup({
    on_attach = function(client, bufnr)
        lspconfig.util.default_config.on_attach(client, bufnr)
        client.server_capabilities.hoverProvider = false
    end,
})
