return {
	-- { "rebelot/kanagawa.nvim", priority = 1000, lazy = true },
	-- {
	-- 	"shaunsingh/nord.nvim",
	-- 	priority = 1000, -- Ensure it loads first
	-- },
	-- {
	-- 	"Mofiqul/dracula.nvim",
	-- 	priority = 1000, -- Ensure it loads first
	-- },
	-- {
	-- 	"olimorris/onedarkpro.nvim",
	-- 	priority = 1000, -- Ensure it loads first
	-- },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	-- { "sainnhe/everforest", priority = 1000 },
	-- { "ellisonleao/gruvbox.nvim", priority = 1000 },
-- 	{ "tribela/vim-transparent" },
	-- {
	-- 	"fynnfluegge/monet.nvim",
	-- 	name = "monet",
	-- 	opts = {
	-- 		tranparent_background = true,
	-- 		dark_mode = true,
	-- 	},
	-- },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	priority = 1000,
	-- 	opts = {},
	-- },
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	priority = 1000,
	-- },
	-- { "kepano/flexoki-neovim", priority = 1000, name = "flexoki" },
	-- { "jacoborus/tender.vim", priority = 1000, name = "tender" },
	-- { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
	-- {
	-- 	"scottmckendry/cyberdream.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("cyberdream").setup({
	-- 			-- Recommended - see "Configuring" below for more config options
	-- 			transparent = true,
	-- 			italic_comments = true,
	-- 			hide_fillchars = true,
	-- 			borderless_telescope = true,
	-- 			terminal_colors = true,
	-- 		})
	-- 		vim.cmd("colorscheme cyberdream") -- set the colorscheme
	-- 	end,
	-- },
	{ "rose-pine/neovim", as = "rose-pine" },
}
