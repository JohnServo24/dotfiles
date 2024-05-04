return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)


            -- lsp_zero.format_on_save({
            --     format_opts = {
            --         async = false,
            --         timeout_ms = 10000,
            --     },
            --     servers = {
            --         ['tsserver'] = { 'javascript', 'typescript' },
            --         ['svelte'] = { 'svelte' },
            --         ['lua_ls'] = { 'lua' }
            --     }
            -- })

            require('mason-lspconfig').setup({
                ensure_installed = { 'tsserver', 'lua_ls' },
                handlers = {
                    lsp_zero.default_setup
                }
            })
        end
    },
    { 'neovim/nvim-lspconfig' },
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    },
    { 'williamboman/mason-lspconfig.nvim' },
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            "rafamadriz/friendly-snippets"
        }
    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')

            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-h>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                }),
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
            })
        end
    },
    { 'hrsh7th/cmp-nvim-lsp' },
}
