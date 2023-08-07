print("hi")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "[p]roject [v]iew" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "shift selected lines down by 1 line" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "shift selected lines up by 1 line" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "move +1 line to current line" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "half page down centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "half page up centered" })
vim.keymap.set("n", "n", "nzzzv", { desc = "next highlight centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "prev highlight centered" })

vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "paste over" })

vim.keymap.set("n", "<leader>y", "\"+y", { desc = "yank to system clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "yank to system clipboard" })

vim.keymap.set("n", "<leader>d", "\"_d", { desc = "delete into void register" })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = "delete into void register" })

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessoinizer<CR>", { desc = "new tmux session" })
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, { desc = "manually format" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "rename word under cursor in current file" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "make file executable" })
