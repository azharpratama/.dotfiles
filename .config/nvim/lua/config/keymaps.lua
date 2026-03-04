local wk = require("which-key")

wk.add({
  -- Clipboard
  { "<leader>y", '"+y', desc = "Yank to system clipboard", mode = { "n", "v" } },
  { "<leader>Y", '"+yg_', desc = "Yank EOL to system clipboard", mode = "n" },
  { "<leader>p", '"+p', desc = "Paste from system clipboard", mode = { "n", "v" } },
  { "<leader>P", '"+P', desc = "Paste from system clipboard above", mode = { "n", "v" } },

  -- Telescope
  { "<leader>f", group = "Telescope" },
  { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
  { "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Current Buffer Fuzzy Find" },
  { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
  { "<leader>fg", "<cmd>Telescope git_files<CR>", desc = "Git Files" },
  { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },
  { "<leader>fl", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
  { "<leader>ft", "<cmd>Telescope<CR>", desc = "Telescope Builtin" },

  -- Diagnostic
  { "[d", vim.diagnostic.goto_prev, desc = "Previous Diagnostic" },
  { "]d", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
  { "<leader>e", vim.diagnostic.open_float, desc = "Show Error messages" },
  { "<leader>q", vim.diagnostic.setloclist, desc = "Open Quickfix list" },

  -- LSP
  { "K", vim.lsp.buf.hover, desc = "Hover" },
  { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" } },
  { "<leader>gd", vim.lsp.buf.definition, desc = "Go to Definition" },
  { "<leader>gD", vim.lsp.buf.declaration, desc = "Go to Declaration" },
  { "<leader>gf", vim.lsp.buf.format, desc = "Format" },
  { "<leader>gr", vim.lsp.buf.rename, desc = "Rename" },

  -- Git
  { "<leader>gp", ":Gitsigns preview_hunk<CR>", desc = "Preview Hunk" },

  -- NvimTree
  { "<leader>t", group = "NvimTree" },
  { "<leader>tc", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse" },
  { "<leader>tf", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Find File Toggle" },
  { "<leader>tr", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh" },
  { "<leader>tt", "<cmd>NvimTreeToggle<CR>", desc = "Toggle" },

  -- Snippets
  { "<C-k>", function() require("luasnip").expand_or_jump() end, { desc = "Expand or jump snippet", mode = { "i", "s" }, silent = true } },
  { "<C-j>", function() require("luasnip").jump(-1) end, { desc = "Jump back in snippet", mode = { "i", "s" }, silent = true } },

  -- Harpoon
  { "<leader>h", group = "Harpoon" },
  { "<leader>ha", function() require("harpoon"):list():add() end, { desc = "Add to List" } },
  { "<leader>hl", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, { desc = "Quick Menu" } },
  { "<M-j>", function() require("harpoon"):list():select(1) end, { desc = "Select Harpoon 1" } },
  { "<M-k>", function() require("harpoon"):list():select(2) end, { desc = "Select Harpoon 2" } },
  { "<M-l>", function() require("harpoon"):list():select(3) end, { desc = "Select Harpoon 3" } },
  { "<M-;>", function() require("harpoon"):list():select(4) end, { desc = "Select Harpoon 4" } },

  -- Oil
  { "-", "<CMD>Oil<CR>", { desc = "Open parent directory" } },
})

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")