return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				term_colors = true,
				transparent_background = true,
				styles = {
					comments = {},
					conditionals = {},
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
				},
				color_overrides = {
					mocha = {
						base = "#000000",
						mantle = "#000000",
						crust = "#000000",
					},
				},
				integrations = {
					telescope = {
						enabled = true,
						style = "nvchad",
					},
					dropbar = {
						enabled = true,
						color_mode = true,
					},
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = "letieu/harpoon-lualine",
		opts = {
			sections = {
				lualine_a = { "harpoon2" },
				lualine_b = { "filename" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		},
	},
}
