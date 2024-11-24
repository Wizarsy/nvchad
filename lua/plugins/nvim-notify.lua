return {
  "rcarriga/nvim-notify",
  lazy = false,
  config = function()
    local n = require "notify"
    n.setup { background_colour = "#1A1B26" }
    vim.notify = n
  end,
}
