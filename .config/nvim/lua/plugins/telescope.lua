return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5',
	lazy = false,
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ '<leader>lg', "<cmd>Telescope live_grep<cr>",  desc = "[l]ive [g]rep" },
		{ '<leader>pf', "<cmd>Telescope find_files<cr>", desc = "[p]roject [f]iles (all)" },
		{ '<C-p>',      "<cmd>Telescope git_files<cr>",  desc = "[p]roject [f]iles (git)" },
		{
			'<leader>ps',
			function()
				local builtin = require('telescope.builtin')
				builtin.grep_string({ search = vim.fn.input("grep > ") })
			end,
			desc = "[p]roject [s]tring"
		},
		{ '<leader>cmd', "<cmd>Telescope commands<cr>", desc = "telescope commands" },
		{ '<leader>km',  "<cmd>Telescope keymaps<cr>",  desc = "[k]ey[m]aps" },
	},
}
