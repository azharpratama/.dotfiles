return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "auto",
      background = {
        light = "latte",
        dark = "macchiato",
      },
      transparent_background = true,
      auto_integrations = true,
      custom_highlights = {
        NormalFloat = { bg = "none" },
        TelescopeBorder = { bg = "none" },
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
