local lsp_ok, lsp = pcall(require, "lsp-zero")
if not lsp_ok then
    return
end

lsp.preset({})

----- LSP ZERO STUFF -----
local k = vim.keymap.set
lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_autoformat()

    -- k({ 'n', 'x' }, 'gq', function()
    --     vim.lsp.buf.format({
    --         async = false,
    --         timeout_ms = 10000
    --     })
    -- end)
end)

----- CMP -----
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

lsp.setup_nvim_cmp({
    mapping = lsp.defaults.cmp_mappings({
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
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})

----- LS CONFIGURATIONS -----
local lsp_config_ok, lsp_config = pcall(require, "lspconfig")
if not lsp_config_ok then
    return
end

-- Lua ls
lsp_config.lua_ls.setup(lsp.nvim_lua_ls())

-- Emmet ls
lsp_config.emmet_ls.setup({
    filetypes = { 'html', 'javascript', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'vue' },
})

----- SNIPPETS -----
local luasnip_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_ok then
    return
end

local from_vscode_ok, from_vscode = pcall(require, "luasnip.loaders.from_vscode")
if not from_vscode_ok then
    return
end

from_vscode.lazy_load()
luasnip.filetype_extend("vue", { "vue" })
luasnip.filetype_extend("javascript", { "javascriptreact" })

------------------------------
lsp.setup()
------------------------------

----- NULL LS -----
local setup, null_ls = pcall(require, "null-ls")
if not setup then
    return
end

local null_opts = lsp.build_options('null-ls', {})

local formatting = null_ls.builtins.formatting   -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

null_ls.setup({
    on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)
    end,
    sources = {
        null_ls.builtins.formatting.black,
        formatting.prettier.with({
            condition = function(utils)
                return utils.root_has_file(".prettierrc")
            end,
        }),
        diagnostics.eslint_d.with({
            condition = function(utils)
                return utils.root_has_file(".eslintrc")
            end,
        }),
    }
})
