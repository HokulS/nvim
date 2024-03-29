local configs = require("nvim-treesitter.configs")

configs.setup {
  ensure_installed = "all",
  sync_install = false, 
  auto_install = true,
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {'help'},
    additional_vim_regex_highlighting = true,
  },
}
