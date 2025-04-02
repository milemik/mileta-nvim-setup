return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { 
          "lua_ls",
          "gopls",
          "docker_compose_language_service",
          "dockerls",
          "html",
          "tailwindcss",
          "eslint",
          "jsonls",
          "ruff",
          "terraformls",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.docker_compose_language_service.setup({})
      lspconfig.dockerls.setup({})
      lspconfig.html.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.htmx.setup({})
      lspconfig.eslint.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.ruff.setup({})
      lspconfig.terraformls.setup({})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end
  }
}
