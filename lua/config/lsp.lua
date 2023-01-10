require('lsp-setup').setup({
  default_mappings = true,
  -- Global on_attach
  on_attach = function(client, bufnr)
      -- Support custom the on_attach function for global
      -- Formatting on save as default
      require('lsp-setup.utils').format_on_save(client)
  end,
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
    sumneko_lua = {},
    marksman = {},
    pylsp = {},
    sqlls = {},
    lemminx = {},
    yamlls = {},
    zls = {},
    taplo = {},
    tailwindcss = {},
    rust_analyzer = require('lsp-setup.rust-tools').setup({
      server = {
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
      },
    })
  }
})
