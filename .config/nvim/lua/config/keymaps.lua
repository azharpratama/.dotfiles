-- Clipboard
vim.keymap.set("n", "<leader>Y", '"+yg_', { desc = "[Y]ank end of line to system clipboard" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "[y]ank to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "[y]ank to system clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "[p]aste from system clipboard" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "[P]aste from system clipboard above" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "[p]aste from system clipboard" })
vim.keymap.set("v", "<leader>P", '"+P', { desc = "[P]aste from system clipboard above" })

-- Telescope
local wk = require("which-key")
wk.add({
  { "<leader>f",  group = "Telescope" },
  { "<leader>fb", "<cmd>Telescope buffers<CR>",                   desc = "[B]uffers" },
  { "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "[C]urrent Buffer Fuzzy Find" },
  { "<leader>ff", "<cmd>Telescope find_files<CR>",                desc = "[F]ind Files" },
  { "<leader>fg", "<cmd>Telescope git_files<CR>",                 desc = "[G]it Files" },
  { "<leader>fh", "<cmd>Telescope help_tags<CR>",                 desc = "[H]elp Tags" },
  { "<leader>fl", "<cmd>Telescope live_grep<CR>",                 desc = "[L]ive Grep" },
  { "<leader>ft", "<cmd>Telescope<CR>",                           desc = "[T]elescope Builtin" },
})

-- Diagnostic
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, {})

-- Git
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})

-- NvimTree
wk.add({
  { "<leader>t",  group = "NvimTree" },
  { "<leader>tc", "<cmd>NvimTreeCollapse<CR>",       desc = "NvimTree Collapse" },
  { "<leader>tf", "<cmd>NvimTreeFindFileToggle<CR>", desc = "NvimTree Find File Toggle" },
  { "<leader>tr", "<cmd>NvimTreeRefresh<CR>",        desc = "NvimTree Refresh" },
  { "<leader>tt", "<cmd>NvimTreeToggle<CR>",         desc = "NvimTree Toggle" },
})

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
