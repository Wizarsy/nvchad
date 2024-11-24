return {
  "neovim/nvim-lspconfig",
  event = "VimEnter",
  dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
  config = function()
    local nvlsp = require "nvchad.configs.lspconfig"
    nvlsp.defaults()
    local lspconfig = require "lspconfig"
    local servers = {
      html = {},
      cssls = {},
      pyright = {},
      bashls = {},
      gopls = {},
      clangd = {},
      sqlls = {},
    }
    for name, opts in pairs(servers) do
      opts.on_attach = nvlsp.on_attach
      opts.on_init = nvlsp.on_init
      opts.capabilities = nvlsp.capabilities
      lspconfig[name].setup(opts)
    end
  end,
}
