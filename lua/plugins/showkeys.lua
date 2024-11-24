return {
  "siduck/showkeys",
  event = "VimEnter",
  cmd = "ShowkeysToggle",
  config = function()
    require("showkeys").setup {
      timeout = 1,
      maxkeys = 5,
    }
    vim.cmd "ShowkeysToggle"
  end,
}
