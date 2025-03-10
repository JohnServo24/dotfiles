local status_ok, indent_blankline = pcall(require, "indent-blankline")
if not status_ok then
    return
end

-- vim.opt.list = true

indent_blankline.setup()
