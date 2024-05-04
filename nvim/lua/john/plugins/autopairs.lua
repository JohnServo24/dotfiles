return {
    "windwp/nvim-autopairs",
    opts = {
        check_ts = true,
        ts_config = {
            lua = { "string" },
            javascript = { "template_string" }
        }
    }
}
