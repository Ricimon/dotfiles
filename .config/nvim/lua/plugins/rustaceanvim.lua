return {
  "mrcjkb/rustaceanvim",
  ft = { "rust" },
  init = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(client, bufnr)
          local lsp_map = function(mode, keys, func, desc)
            vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
          end

          -- rust-lsp
          lsp_map("n", "K", function() vim.cmd.RustLsp({ "hover", "actions" }) end, "Rust hover docs")
          lsp_map("n", "J", function() vim.cmd.RustLsp("joinLines") end, "Rust join lines")
          lsp_map("n", "<Leader>ca", function() vim.cmd.RustLsp("codeAction") end, "Rust Code action")
          lsp_map("n", "<Leader>rue", function() vim.cmd.RustLsp("explainError") end, "Rust error explain")
          lsp_map("n", "<Leader>rud", function() vim.cmd.RustLsp("openDocs") end, "Rust docs")
          lsp_map("n", "<Leader>rum", function() vim.cmd.RustLsp("expandMacro") end, "Rust expand macro")

          -- copy from lsp_config
          lsp_map("n", "gd", vim.lsp.buf.definition, "Goto definition")
          lsp_map("n", "gD", vim.lsp.buf.declaration, "Goto declaration")
          lsp_map("n", "gI", vim.lsp.buf.implementation, "Goto implementation")
          lsp_map("n", "go", vim.lsp.buf.type_definition, "Goto type definition")

          -- https://github.com/mrcjkb/rustaceanvim/issues/28#issuecomment-2054117845
          local format_sync_grp = vim.api.nvim_create_augroup("RustaceanFormat", {})
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function() vim.lsp.buf.format() end,
            group = format_sync_grp,
          })
        end,
      },
    }
  end,
}
