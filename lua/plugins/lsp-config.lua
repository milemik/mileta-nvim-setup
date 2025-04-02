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
      lspconfig.eslint.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.ruff.setup({})
      lspconfig.terraformls.setup({})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.ruff,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.completion.spell,
    },
    -- Formating shortcats
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
})
    end
  }
}
