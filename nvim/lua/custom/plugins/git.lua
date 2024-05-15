return {
	"tpope/vim-fugitive",
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
				end

				map("n", "]h", gs.next_hunk, "Next Hunk")
				map("n", "[h", gs.prev_hunk, "Prev Hunk")
			end,
		},
	},
	{
		"f-person/git-blame.nvim",
		config = function()
			require("gitblame").setup({ enabled = false })
			vim.keymap.set("n", "bl", "<cmd>:GitBlameToggle<CR>", { desc = "Toggle [G]it [B]lame" })
		end,
	},
}
