return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      extensions = {
        "fugitive",
        "nvim-tree",
      },
      options = {
        component_separators = "│",
        section_separators = "",
        globalstatus = true,
      },
      sections = {
        lualine_x = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
          },
          { "encoding" },
          { "filetype" },
        },
      },
    })
  end,
}
