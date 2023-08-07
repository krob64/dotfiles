return { 
	"nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "vimdoc", "c", "lua", "rust" },
                highlight = { enable = true, }
            }
        end 
}
