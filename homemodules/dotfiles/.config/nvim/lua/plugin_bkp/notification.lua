return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	opts = {
		timeout = 500,
		render = "compact",
		background_colour = "#000000",
		max_height = function()
			return math.floor(vim.o.lines * 0.75)
		end,
		max_width = function()
			return math.floor(vim.o.columns * 0.25)
		end,
		on_open = function(win)
			vim.api.nvim_win_set_config(win, { zindex = 100 })
		end,
	},
}
