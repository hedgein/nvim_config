-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"


lspconfig.rust_analyzer.setup({
  filetypes = {"rust"},
  on_attach = function(client, bufnr)
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end,
  settings = {
    ['rust_analyzer'] = {
      cargo = {
        allFeatures = true
      },
      checkOnSave = {
        command = "clippy"
      },
    },
  },
})

-- lsps with default config
--for _, lsp in ipairs(servers) do
-- lspconfig[lsp].setup {
-- on_attach = nvlsp.on_attach,
-- on_init = nvlsp.on_init,
-- capabilities = nvlsp.capabilities,
-- }
-- end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
