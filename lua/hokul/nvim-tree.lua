vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  hijack_unnamed_buffer_when_opening = true,
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
    view = {
        mappings = {
            custom_only = false,
            list = {
                { key = "l", action = "edit", action_cb = edit_or_open },
                { key = "v", action = "vsplit", action_cb = vsplit },
                { key = "h", action = "close_node" },
                { key = "H", action = "collapse_all", action_cb = collapse_all }
            }
        },
    },
})
