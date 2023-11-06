local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    "catppuccin/nvim",
    "numToStr/Comment.nvim",
    "nvim-lua/plenary.nvim",
    "theprimeagen/harpoon",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim",
    "nvim-lualine/lualine.nvim",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",
    "lewis6991/impatient.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "windwp/nvim-autopairs",
    "iamcco/markdown-preview.nvim",
    "tpope/vim-surround",
    "p00f/nvim-ts-rainbow",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "windwp/nvim-ts-autotag",
    "jose-elias-alvarez/null-ls.nvim",
    "andweeb/presence.nvim",
    "rest-nvim/rest.nvim",
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'saadparwaiz1/cmp_luasnip' },
            {
                'L3MON4D3/LuaSnip',
                dependencies = { "rafamadriz/friendly-snippets" }
            },
        }
    },
}

local opts = {}
require("lazy").setup(plugins, opts);
