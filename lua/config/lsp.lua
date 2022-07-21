require('nvim-lsp-setup').setup({
  default_mappings = true,
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
    sourcekit = {},
    taplo = {},
    tailwindcss = {},
    rust_analyzer = require('nvim-lsp-setup.rust-tools').setup({
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
