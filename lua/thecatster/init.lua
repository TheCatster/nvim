local vim = vim

---------------
--- Keymaps ---
---------------

-- Save faster
vim.keymap.set("n", "<leader>w", ":w<CR>", { remap = true })

-- Explore faster
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)
