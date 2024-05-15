vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<left>", '<cmd>echo "You can\'t use arrows 😈"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "You can\'t use arrows 😈"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "You can\'t use arrows 😈"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "You can\'t use arrows 😈"<CR>')

vim.keymap.set("n", "<leader>j", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==", { noremap = true, silent = true })

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "er", vim.diagnostic.open_float, { desc = "Open [ER]ror list" })

vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

vim.keymap.set("n", "<leader>0", "<cmd>:e!<CR>", { desc = "[R]eload file" })

function ToggleWrap()
	vim.wo.wrap = not vim.wo.wrap
end
vim.api.nvim_set_keymap("n", "<leader>w", ":lua ToggleWrap()<CR>", { noremap = true, silent = true })
