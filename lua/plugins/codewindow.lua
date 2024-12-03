return {
  "gorbit99/codewindow.nvim",
  event = { "BufEnter" },
  opts = {
    window_border = "rounded",
  },
  config = function(_, opts)
    local codewindow = require "codewindow"
    codewindow.setup(opts)
    codewindow.apply_default_keybinds()
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      callback = function()
        codewindow.open_minimap()
      end,
    })
    vim.api.nvim_create_autocmd({ "BufDelete" }, {
      callback = function()
        codewindow.close_minimap()
      end,
    })
  end,
}
