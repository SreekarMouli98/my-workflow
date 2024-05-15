return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
		},
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		-- {
		-- 	"zbirenbaum/copilot.lua",
		-- 	cmd = "Copilot",
		-- 	event = "InsertEnter",
		-- 	config = function()
		-- 		require("copilot").setup({})
		-- 	end,
		-- },
		-- {
		-- 	"zbirenbaum/copilot-cmp",
		-- 	config = function()
		-- 		require("copilot_cmp").setup()
		-- 	end,
		-- },
		"f3fora/cmp-spell",
		"hrsh7th/cmp-emoji",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,noinsert" },

			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = {
				-- { name = "copilot" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "emoji" },
				{
					name = "spell",
					option = {
						keep_all_entries = false,
						enable_in_context = function()
							return true
						end,
					},
				},
			},
		})
	end,
}
