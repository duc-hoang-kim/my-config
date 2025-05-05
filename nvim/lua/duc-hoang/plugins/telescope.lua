return {
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").setup({
				defaults = { mappings = { i = { ["<C-h>"] = "which_key" } } },
				pickers = {
					commands = { theme = "ivy" },
					find_files = { hidden = true, theme = "ivy" },
					buffers = { theme = "ivy" },
					lsp_definitions = { theme = "cursor" },
					lsp_references = { theme = "cursor" },
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})
		end,
	},
	{
		"prochri/telescope-all-recent.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-telescope/telescope.nvim", "kkharji/sqlite.lua", "stevearc/dressing.nvim" },
		opts = {},
	},
	{
		"Sharonex/grape.nvim",
		keys = { { "<leader>fs", "<cmd>lua require('grape').live_grape()<cr>", desc = "Fuzzier live grep" } },
	},
}
