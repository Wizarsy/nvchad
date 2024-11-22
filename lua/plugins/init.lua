return {
  {
    "neovim/nvim-lspconfig",
    event = "VimEnter",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("lint").linters_by_ft = {
        lua = { "luac" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "TextChanged" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    opts = require "configs.treesitter",
  },

  {
    "nvim-lua/lsp-status.nvim",
    config = function()
      require("lsp-status").register_progress()
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = { automatic_installation = true },
  },
  {
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
  },
  {
    "zapling/mason-conform.nvim",
    event = "VimEnter",
    dependencies = {
      "williamboman/mason.nvim",
      "stevearc/conform.nvim",
    },
    opts = {},
  },

  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      local n = require "notify"
      n.setup { background_colour = "#1A1B26" }
      vim.notify = n
    end,
  },

  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    opts = require "configs.yazi",
  },
  {
    "Bekaboo/dropbar.nvim",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
}
