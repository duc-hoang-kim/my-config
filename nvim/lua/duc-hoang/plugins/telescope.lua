return {
	{
		"nvim-telescope/telescope.nvim",
		opts = function(_, opts)
			local _, actions = pcall(require, "telescope.actions")
			opts.defaults.cache_picker = opts.defaults.cache_picker or {}
			opts.pickers.find_files.hidden = true
			opts.pickers.commands = {
				theme = "ivy",
			}
			opts.pickers.find_files = {
				theme = "ivy",
			}
			opts.pickers.buffers = {
				theme = "ivy",
			}
			opts.pickers.lsp_definitions = {
				theme = "cursor",
			}
			opts.pickers.lsp_references = {
				theme = "cursor",
			}
			opts.pickers.buffers.initial_mode = "insert"
		end,
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
			{ "tsakirist/telescope-lazy.nvim" },
			{
				"danielfalk/smart-open.nvim",
				branch = "0.2.x",
				config = function()
					require("telescope").load_extension("smart_open")
					local config = require("smart-open").config
					config.match_algorithm = "fzf"
					config.show_scores = true
				end,
				dependencies = {
					"kkharji/sqlite.lua",
				},
			},
			{
				"jonarrien/telescope-cmdline.nvim",
			},
		},
		keys = function(_, keys)
			keys[#keys + 1] = { "<leader>sl", "<cmd>Telescope lazy<cr>", desc = "Lazy Plugins" }
			return keys
		end,
	},

	{
		"prochri/telescope-picker-history-action",
		dependencies = { "nvim-telescope/telescope.nvim" },
		lazy = true,
		opts = true,
	},
	{
		"prochri/telescope-all-recent.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-telescope/telescope.nvim", "kkharji/sqlite.lua", "stevearc/dressing.nvim" },
		opts = {
			-- debug = true,
			-- pickers = {
			-- 	["lazy#lazy"] = {
			-- 		disable = false,
			-- 		use_cwd = false,
			-- 	},
			-- },
			-- vim_ui_select = {
			-- 	kinds = {
			-- 		overseer_template = {
			-- 			use_cwd = true,
			-- 			prompt = "Task template",
			-- 			name_include_prompt = true,
			-- 		},
			-- 		overseer_task_options = {
			-- 			use_cwd = true,
			-- 			name_include_prompt = true,
			-- 		},
			-- 		resession_load = {
			-- 			use_cwd = false,
			-- 		},
			-- 		codeaction = {
			-- 			use_cwd = false,
			-- 		},
			-- 	},
			-- 	-- only fallback, if no kind exists or is found
			-- 	prompts = {
			-- 		["Load session"] = {
			-- 			use_cwd = false,
			-- 		},
			-- 	},
			-- },
		},
	},
	{
		"Sharonex/grape.nvim",
		keys = {
			{ "<leader>fs", "<cmd>lua require('grape').live_grape()<cr>", desc = "Fuzzier live grep" },
		},
	},
	{ "tiagovla/scope.nvim" },
}
