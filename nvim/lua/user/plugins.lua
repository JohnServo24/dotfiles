-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Packer can manage itself
	use("nvim-lua/popup.nvim") -- Popup API from vim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
	use("Mofiqul/vscode.nvim") -- theme
	use("andweeb/presence.nvim") -- Discord presence
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("nvim-tree/nvim-web-devicons") -- web dev icons
	use("nvim-tree/nvim-tree.lua") -- file tree
	use("nvim-lualine/lualine.nvim") -- status bar
	use("akinsho/bufferline.nvim") -- bufferline
	use("moll/vim-bbye")
	use("akinsho/toggleterm.nvim") -- terminal
	use("ahmedkhalf/project.nvim") -- project manager
	use("lewis6991/impatient.nvim") -- impatient
	use("lukas-reineke/indent-blankline.nvim") -- Indent lines
	use("goolord/alpha-nvim") -- greeter
	use("iamcco/markdown-preview.nvim") -- markdown previewer
	use("tpope/vim-surround") -- for surrounding

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("saadparwaiz1/cmp_luasnip")

	-- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")

	-- Code formatting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- Telescope
	use("nvim-telescope/telescope.nvim") -- telescope

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter", -- Treesitter
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- Auto-closing
	use("windwp/nvim-autopairs") -- auto pairing for brackets
	use("windwp/nvim-ts-autotag") -- auto tags

	use("p00f/nvim-ts-rainbow") -- ts rainbow for brackets
	use("JoosepAlviste/nvim-ts-context-commentstring") -- helps with commenting out JSX

	-- Git
	use("lewis6991/gitsigns.nvim")
end)
