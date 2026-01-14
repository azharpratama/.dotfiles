return {
  "neovim/nvim-lspconfig",
  version = "*",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",

    -- IMPORTANT: load eagerly so filetype detection stays correct
    {
      "folke/lazydev.nvim",
      lazy = false,
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },

  config = function()
    -----------------------------------------------------------------------
    -- Capabilities
    -----------------------------------------------------------------------
    local capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities()
    )

    -- Disable file watchers (Neovim warns if not set)
    capabilities.workspace = capabilities.workspace or {}
    capabilities.workspace.didChangeWatchedFiles = { dynamicRegistration = false }

    -----------------------------------------------------------------------
    -- Servers
    -----------------------------------------------------------------------
    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            completion = { callSnippet = "Replace" },
            diagnostics = { globals = { "vim" } },
          },
        },
      },

      taplo = {},
      clangd = {},
      pyright = {},
      rust_analyzer = {},
      gopls = {},

      html = {},
      emmet_language_server = {},
      cssls = {},
      tailwindcss = {},
      ts_ls = {},
      prismals = {},
      eslint = {},

      solidity_ls = {},
      stylua = {},
    }

    -----------------------------------------------------------------------
    -- Mason
    -----------------------------------------------------------------------
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(servers),
      handlers = {

        -- Default setup handler
        function(server_name)
          local opts = servers[server_name] or {}
          opts.capabilities = vim.tbl_deep_extend(
            "force",
            {},
            capabilities,
            opts.capabilities or {}
          )

          require("lspconfig")[server_name].setup(opts)
        end,
      },
    })
  end,
}
