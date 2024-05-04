return {
    "windwp/nvim-ts-autotag",
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "javascript",
                    "typescript",
                    "css",
                    "html",
                    "json",
                    "markdown"
                },
                auto_install = true,
                highlight = {
                    enable = true,
                    disable = { "" },
                    additional_vim_regex_highlighting = true,
                },
                indent = {
                    enable = true
                },
                autopairs = {
                    enable = true,
                },
                autotag = {
                    enable = true
                },
                sync_install = false,
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
            })
        end
    }
}
