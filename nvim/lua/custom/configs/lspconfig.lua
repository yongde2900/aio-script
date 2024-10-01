local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = {
  "tsserver",
  "eslint",
  "prettier", -- ts/js formatter
  "html",
  "cssls",
  "tailwindcss",
  "lua_ls",
  "emmet_ls",
  "intelephense",
  "pyre",
  "bashls",
  "volar",
  "rust_analyzer",
  "stylua", -- lua formatter
  "eslint_d", -- ts/js linter
  "pint", --php formatter
  "phpstan", -- php linter
  "rustfmt",
  "gopls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig["tsserver"].setup {
--   filetypes = { "typescript" },
-- }
