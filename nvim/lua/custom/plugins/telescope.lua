return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			version = "^1.0.0",
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
				file_browser = {},
			},
		})
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "live_grep_args")
		pcall(require("telescope").load_extension, "ui-select")
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
		vim.keymap.set("n", "sf", builtin.find_files, { desc = "[S]earch [F]iles", silent = true })
		vim.keymap.set(
			"n",
			"sg",
			":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
			{ desc = "[S]earch [G]rep", silent = true }
		)
		vim.keymap.set("n", "ss", builtin.lsp_document_symbols, { desc = "[S]earch [S]ymbols" })
		vim.keymap.set("n", "sr", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
