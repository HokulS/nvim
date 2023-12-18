local fn = vim.fn

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install your plugins here
require("lazy").setup({
  "nvim-lua/popup.nvim" ,
  "nvim-lua/plenary.nvim" ,
  "lunarvim/colorschemes" ,
  "rebelot/kanagawa.nvim" ,
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  "xiyaowong/nvim-transparent",

  'neovim/nvim-lspconfig',
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'nvim-lualine/lualine.nvim',

  {
      'L3MON4D3/LuaSnip',
      version = "2.1.1", 
     dependencies = { "rafamadriz/friendly-snippets" },
     build = "make install_jsregexp"
  },
  'saadparwaiz1/cmp_luasnip',

  'numToStr/Comment.nvim',
  'lervag/vimtex',
  'tpope/vim-fugitive',
  'nvim-telescope/telescope.nvim',
  'ThePrimeagen/harpoon',
  'lewis6991/gitsigns.nvim',
  'MunifTanjim/nui.nvim',
  'phaazon/hop.nvim',
  'stevearc/oil.nvim',
  'windwp/nvim-autopairs',
  'jose-elias-alvarez/null-ls.nvim',
  { 
      'kkoomen/vim-doge',
      build = ':call doge#install()'
  },
  'vim-scripts/DoxygenToolkit.vim'
  })


