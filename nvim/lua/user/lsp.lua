local lsp_ok, lsp = pcall(require, "lsp-zero")
if not lsp_ok then
    return
end

lsp.preset({})

----- LSP ZERO STUFF -----
local k = vim.keymap.set
lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })

    k({ 'n', 'x' }, 'gq', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end)
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
        ["<C-b>"] = cmp.mapping.scroll_docs( -4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-h>"] = cmp.mapping.abort(),
        ["<C-l>"] = cmp.mapping.confirm({ select = false }),
    })
})

----- LS CONFIGURATIONS -----
local lsp_config_ok, lsp_config = pcall(require, "lspconfig")
if not lsp_config_ok then
    return
end

-- Lua ls
lsp_config.lua_ls.setup(lsp.nvim_lua_ls())

------------------------------
lsp.setup()
------------------------------

----- NULL LS -----
local setup, null_ls = pcall(require, "null-ls")
local null_opts = lsp.build_options('null-ls', {})
if not setup then
    return
end

local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

null_ls.setup({
    on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)
    end,
    sources = {
        formatting.prettier.with({
            condition = function(utils)
                return utils.root_has_file(".prettierrc.json")
            end,
        }),
        diagnostics.eslint_d.with({
            condition = function(utils)
                return utils.root_has_file(".eslintrc.json")
            end,
        }),
    }
})