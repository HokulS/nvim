return {
    {
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
            vim.keymap.set("n", "-", "<cmd>Oil --float<cr>", { desc = "Open parent directory" })
        end
    }
}
