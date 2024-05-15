return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = true,
			},
		})
		vim.keymap.set("n", "fe", "<CMD>Oil<CR>", { desc = "File Explorer" })
		vim.keymap.set("n", "re", "<CMD>Oil .<CR>", { desc = "Root Explorer" })
	end,
}
