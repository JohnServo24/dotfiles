-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth", "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer can manage itself
    use 'nvim-lua/popup.nvim' -- Popup API from vim
    use 'nvim-lua/plenary.nvim' -- Useful lua functions used by lots of plugins
    use 'Mofiqul/vscode.nvim' -- theme
    use 'windwp/nvim-autopairs' -- auto pairing for brackets
    use 'andweeb/presence.nvim' -- Discord presence
    use 'numToStr/Comment.nvim' -- Easily comment stuff
    use 'nvim-tree/nvim-web-devicons' -- web dev icons
    use 'nvim-tree/nvim-tree.lua' -- file tree
    use 'nvim-lualine/lualine.nvim' -- status bar
    use 'akinsho/bufferline.nvim' -- nvim
    use 'moll/vim-bbye'
    use 'akinsho/toggleterm.nvim' -- terminal
    use 'ahmedkhalf/project.nvim' -- project manager
    use 'lewis6991/impatient.nvim' -- impatient
    use 'lukas-reineke/indent-blankline.nvim' -- Indent lines
    use 'goolord/alpha-nvim' -- greeter
    use 'iamcco/markdown-preview.nvim' -- markdown previewer

    -- cmp plugins
    use 'hrsh7th/nvim-cmp' -- The completion plugin
    use 'hrsh7th/cmp-buffer' -- Buffer completions
    use 'hrsh7th/cmp-path' -- Path completions
    use 'hrsh7th/cmp-cmdline' -- cmdline completions
    use 'saadparwaiz1/cmp_luasnip' -- snippet completions
    use 'hrsh7th/cmp-nvim-lsp' -- nvim cmp
    use 'hrsh7th/cmp-nvim-lua'

    -- snippets
    use 'L3MON4D3/LuaSnip' -- snippet engine
    use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use

    -- LSP
    use 'neovim/nvim-lspconfig' -- enable LSP
    use 'williamboman/nvim-lsp-installer' -- LSP installer
    use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters

    -- Telescope
    use 'nvim-telescope/telescope.nvim' -- telescope

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter', -- Treesitter
        run = ':TSUpdate'
    }
    use 'p00f/nvim-ts-rainbow' -- ts rainbow for brackets
    use 'JoosepAlviste/nvim-ts-context-commentstring' -- helps with commenting out JSX

    -- Git
    use 'lewis6991/gitsigns.nvim'

end)
