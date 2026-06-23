require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Enter command mode
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<C-p>", "<cmd> Telescope find_files <cr>", { desc = "Find files" })
map("n", "<C-x>", "<cmd> bw <cr>", { desc = "Close buffer" })

map("n", "]e", "<cmd> lua vim.diagnostic.goto_next() <cr>", { desc = "Next diagnostic" })
map("n", "[e", "<cmd> lua vim.diagnostic.goto_prev() <cr>", { desc = "Previous diagnostic" })

local lsp_enabled = true
vim.g.lsp_enabled = true
map("n", "<leader>lp", function()
  vim.g.lsp_enabled = not vim.g.lsp_enabled
  if vim.g.lsp_enabled then
    vim.lsp.start()
    print("LSP enabled")
  else
    vim.lsp.stop_client(vim.lsp.get_active_clients(), true)
    print("LSP disabled")
  end
end, { desc = "Toggle LSP" })


-- Prevent a terminal from starting inside vim i use tmux So deleting those default bindings
vim.keymap.del("n", "<leader>h")
vim.keymap.del("n", "<leader>v")
vim.keymap.del({"n", "t"} , "<A-h>")
vim.keymap.del({"n", "t"} , "<A-v>")
