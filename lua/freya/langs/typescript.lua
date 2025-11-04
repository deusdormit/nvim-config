-- =========================
-- TypeScript Import Helpers
-- =========================
local function organize_imports(bufnr)
  vim.lsp.buf.execute_command({
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(bufnr or 0) },
  })
end

local function remove_unused()
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { "source.removeUnused.ts" },
      diagnostics = {},
    },
  })
end

vim.api.nvim_create_user_command("SortImports", function()
  organize_imports(0)
end, { desc = "Sort/Organize TypeScript imports" })

vim.api.nvim_create_user_command("RemoveUnused", function()
  remove_unused()
end, { desc = "Remove unused TypeScript imports" })

vim.api.nvim_create_user_command("FixImports", function()
  remove_unused()
  organize_imports(0)
end, { desc = "Sort and remove unused imports" })
