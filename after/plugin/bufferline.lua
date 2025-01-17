vim.opt.termguicolors = true

vim.keymap.set({"n","i"}, "<A-h>", "<cmd>BufferLineCyclePrev<cr>", {silent= true})
vim.keymap.set({"n","i"}, "<A-l>", "<cmd>BufferLineCycleNext<cr>", {silent= true})

require("bufferline").setup{
    options = {
        numbers = "none",
        close_command = "bp|sp|bn|bd! %d",
        right_mouse_command = "bp|sp|bn|bd! %d",
        left_mouse_command = "buffer %d",
        modified_icon = "",
        show_close_icon = false,
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 10,
        show_tab_indicators = true,
        indicator = {
            style = "underline",
        },
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin",
        -- separator_style = "slant",
        always_show_bufferline = true,
        diagnostics = false,
        themable = true,
        offsets = {
            {
                filetype = "neo-tree",
                text = "Neo-tree",
                highlight = "Directory",
                text_align = "left",
            },
    }
  }
}
