return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"lua", "python", "javascript", "typescript", "go", "html", "css"},
      auto_install = true,
      sync_install = false,
      highlight = { enable = true},
    })
  end,
}
