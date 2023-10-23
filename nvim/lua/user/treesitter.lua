local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "css",
        "html",
        "json",
        "markdown",
        "lua",
        "http"
    },
	auto_install = true,
	-- enable syntax highlighting
	highlight = {
		enable = true,
		disable = { "" },
		additional_vim_regex_highlighting = true,
	},
	-- enable indentation
	indent = {
        enable = true
    },
	-- enable autopairs
	autopairs = {
		enable = true,
	},
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = {
        enable = true
    },
    sync_install = false,
	-- auto install above language parsers
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	}
})
