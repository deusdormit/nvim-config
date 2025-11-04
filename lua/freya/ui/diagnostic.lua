-- =========================
-- Diagnostic
-- =========================
vim.diagnostic.config({
  virtual_text = true, -- show inline text
  signs = true,        -- show in sign column
  float = { border = "rounded" },
})

-- =========================
-- Keymaps
-- =========================

-- Diagnostics
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics under cursor" })
