return {
    {
        'williamboman/mason.nvim',
        opts = {}
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {}
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            "saghen/blink.cmp",
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            }
        },
        config = function()
            local lspconfig = require "lspconfig"
            local capabilities = require 'blink.cmp'.get_lsp_capabilities()
            -- Lua set up
            lspconfig.lua_ls.setup { capabilities = capabilities }
            -- Python set up
            lspconfig.pylsp.setup {
                capabilities = capabilities,
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                ignore = { 'W391' },
                                maxLineLength = 100,
                            },
                        }
                    }
                }
            }
            -- Rust set up
            lspconfig.rust_analyzer.setup { capabilities = capabilities }

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client == nil then
                        return
                    end

                    if client.supports_method('textDocument/formatting') then
                        vim.api.nvim_create_autocmd('BufWritePre', {
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                            end,
                        })
                    end
                end
            })
        end
    }
}
