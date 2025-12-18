return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      markdown = { "prettier" },
      yaml = { "prettier" },
    },
    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true,
    },
    formatters = {
      prettier = {
        command = "prettier",
        args = { "--stdin-filepath", "$FILENAME", "--single-quote", "--trailing-comma", "es5" },
        stdin = true,
      },
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)

    vim.api.nvim_create_user_command("Format", function()
      require("conform").format({ async = true, lsp_fallback = true })
    end, { desc = "Format current buffer" })
  end,
}
