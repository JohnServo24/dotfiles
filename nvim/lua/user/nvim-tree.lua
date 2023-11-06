-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local opts = { noremap = true, silent = true }
local k = vim.api.nvim_set_keymap

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
k("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

nvim_tree.setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_root = true,
        update_cwd = true,
        ignore_list = {},
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    view = {
        adaptive_size = false,
        width = 35,
        hide_root_folder = false,
        side = "left",
        number = true,
        relativenumber = true,
    },
    actions = {
        open_file = {
            window_picker = { enable = false },
            quit_on_open = true,
        },
    },
    renderer = {
        highlight_git = true,
        root_folder_modifier = ":t",
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
                    untracked = "U",
                    ignored = "◌",
                },
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                },
            },
        },
    },
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
})
