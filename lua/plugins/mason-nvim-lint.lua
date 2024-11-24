return {
  "rshkarin/mason-nvim-lint",
  event = "VimEnter",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-lint",
  },
  opts = {
    ignore_install = { "luac" },
    automatic_installation = true,
  },
}
