return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      filters = {
        git_ignored = false,
        custom = { ".DS_Store" },
      },
      renderer = {
        group_empty = true,
        highlight_git = "name",
      },
      sort = {
        sorter = "case_sensitive",
      },
    })
  end,
}
