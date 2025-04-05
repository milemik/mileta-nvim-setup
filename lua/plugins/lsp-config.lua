return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
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
          "pyright",
          "pylsp",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.gopls.setup({ capabilities = capabilities })
      lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })
      lspconfig.dockerls.setup({ capabilities = capabilities })
      lspconfig.html.setup({ capabilities = capabilities })
      lspconfig.tailwindcss.setup({ capabilities = capabilities })
      lspconfig.eslint.setup({ capabilities = capabilities })
      lspconfig.jsonls.setup({ capabilities = capabilities })
      -- lspconfig.ruff.setup({ capabilities = capabilities })
      lspconfig.pyright.setup({ capabilities = capabilities })
      lspconfig.terraformls.setup({ capabilities = capabilities })
      lspconfig.pylsp.setup({
        capabilities = capabilities,
        settings = {
          pylsp = {
            plugins = {
              flake8 = {
                enabled = true,
                maxLineLength = 120, -- Set your desired line length
                ignore = {}, -- Ignore specific error codes
              },
            },
          },
        },
      })
      -- custom keys
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.black.with({
            extra_args = { "--line-length=120" },
          }),
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.completion.spell,
        },
        -- Formating shortcats
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {}),
      })
    end,
  },
  {
    "milemik/nvim-py-detector",
    depedencies = {
      "pyright",
    },
    config = function()
      require("nvim_py_detector").setup()
    end,
  },
}
