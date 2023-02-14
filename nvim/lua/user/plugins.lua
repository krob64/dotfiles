local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- autpairs, integrates with cmp
  use "numToStr/Comment.nvim" -- easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "akinsho/toggleterm.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- completion plugin
  use "hrsh7th/cmp-buffer"-- completion plugin
  use "hrsh7th/cmp-path" -- completion plugin
  use "hrsh7th/cmp-cmdline" -- completion plugin
  use "saadparwaiz1/cmp_luasnip" -- completion plugin
  use "hrsh7th/cmp-nvim-lsp"
  -- snippets
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use lsp installer

  -- themes
  use "sainnhe/gruvbox-material"
  use "folke/tokyonight.nvim"
  use "navarasu/onedark.nvim"
  use "rebelot/kanagawa.nvim"
  use "sainnhe/everforest"
  -- use {"catppuccin/nvim", as = "catppuccin"}
  -- require("catppuccin").setup()
  -- use({
  --   'NTBBloodbath/doom-one.nvim',
  --   config = function()
  --       require('doom-one').setup({
  --           cursor_coloring = false,
  --           terminal_colors = false,
  --           italic_comments = false,
  --           enable_treesitter = true,
  --           transparent_background = false,
  --           pumblend = {
  --               enable = true,
  --               transparency_amount = 20,
  --           },
  --           plugins_integrations = {
  --               neorg = true,
  --               barbar = true,
  --               bufferline = false,
  --               gitgutter = false,
  --               gitsigns = true,
  --               telescope = false,
  --               neogit = true,
  --               nvim_tree = true,
  --               dashboard = true,
  --               startify = true,
  --               whichkey = true,
  --               indent_blankline = true,
  --               vim_illuminate = true,
  --               lspsaga = false,
  --           },
  --       })
  --   end,
  -- })

  -- telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"

  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = "TSUpdate",
  }
  --use "p00f/nvim-ts-rainbow" --treesitter plugin to make parentheses more distinguishable
  
  --lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true}
  }

  --zenmode
  use "folke/zen-mode.nvim"

-- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
