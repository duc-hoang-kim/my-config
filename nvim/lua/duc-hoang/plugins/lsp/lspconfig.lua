return {
	"neovim/nvim-lspconfig",
	---@class PluginLspOpts
	opts = {
		---@type lspconfig.options
		servers = {
			ruby_lsp = {},
			solargraph = {},
			rubocop = {},
			cucumber_language_server = {},
			ts_ls = {},
		},
		-- setup = {
		-- 	cucumber_language_server = function(_, opts)
		-- 		require("lspconfig").cucumber_language_server.setup({
		-- 			settings = {
		-- 				cucumber = {
		-- 					features = { "features/trades/open_sell_offer_trades.feature" },
		-- 					glue = {
		-- 						-- "features/step_definitions/**/*.rb",
		-- 						"features/step_definitions/trades/process_trade_steps.rb",
		-- 					},
		-- 				},
		-- 			},
		-- 		})
		-- 		return true
		-- 	end,
		-- },
	},
}
