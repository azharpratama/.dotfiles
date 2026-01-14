return {
  "jay-babu/mason-null-ls.nvim",

  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },

  config = function()
    local null_ls = require("null-ls")

    -----------------------------------------------------------------------
    -- Helpers
    -----------------------------------------------------------------------
    local function python_path()
      return (os.getenv("VIRTUAL_ENV")
          or os.getenv("CONDA_PREFIX")
          or "/usr") .. "/bin/python3"
    end

    -----------------------------------------------------------------------
    -- Setup null-ls sources
    -----------------------------------------------------------------------
    null_ls.setup({
      debug = false,

      sources = {

        -- -----------------------------
        -- Diagnostics
        -- -----------------------------
        null_ls.builtins.diagnostics.mypy.with({
          extra_args = function()
            return { "--python-executable", python_path() }
          end,
        }),

        -- -----------------------------
        -- Formatting
        -- -----------------------------
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.stylua,
      },
    })

    -----------------------------------------------------------------------
    -- Mason integration
    -----------------------------------------------------------------------
    require("mason-null-ls").setup({
      ensure_installed = {
        "black",
        "isort",
        "mypy",
        "stylua",
      },
      automatic_installation = true,
    })
  end,
}
