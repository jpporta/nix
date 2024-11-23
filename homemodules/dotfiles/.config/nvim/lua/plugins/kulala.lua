return {
	{
		"mistweaverco/kulala.nvim",
		ft = { "http" },
		config = function()
			local kulala = require("kulala")
			kulala.setup({})
			vim.keymap.set("n", "<leader>ll", function()
				kulala.run()
			end, { noremap = true, silent = true, desc = "Run request" })
			vim.keymap.set("n", "<leader>lc", function()
				kulala.copy()
			end, { noremap = true, silent = true, desc = "Copy cURL" })
			vim.keymap.set("n", "<leader>lp", function()
				kulala.from_curl()
			end, { noremap = true, silent = true, desc = "Past cURL" })
		end,
	},
}
