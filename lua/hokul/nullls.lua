 local null_ls = require('null-ls')
 null_ls.setup({
       sources = {
          --null_ls.builtins.diagnostics.cspell, null_ls.builtins.code_actions.cspell,
          null_ls.builtins.formatting.black,
          null_ls.builtins.diagnostics.cmake_lint, null_ls.builtins.formatting.cmake_format,
          null_ls.builtins.diagnostics.ruff,
          null_ls.builtins.formatting.ruff,
          null_ls.builtins.formatting.clang_format.with({
                extra_args = { "--style=file" },
             }),
       },
    })
