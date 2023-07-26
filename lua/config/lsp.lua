require('lsp-setup').setup({
  default_mappings = true,
  -- Global capabilities
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  -- Configuration of LSP servers
  servers = {
    arduino_language_server = {},
    clangd = {},
    asm_lsp = {},
    bashls = {},
    cmake = {},
    cssls = {},
    clojure_lsp = {},
    dockerls = {},
    eslint = {},
    gopls = {},
    html = {},
    jsonls = {},
    tsserver = {},
    julials = {},
    texlab = {},
    lua_ls = {},
    marksman = {},
    pyright = {},
    ruff_lsp = {},
    sqlls = {},
    lemminx = {},
    yamlls = {},
    zls = {},
    taplo = {},
    tailwindcss = {},
    rust_analyzer = require('lspconfig').rust_analyzer.setup({
      settings = {
        ['rust-analyzer'] = {
          cargo = {
            loadOutDirsFromCheck = true,
          },
          procMacro = {
            enable = true,
          },
        },
      },
    })
  }
})
