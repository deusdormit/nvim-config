local is_windows = vim.loop.os_uname().version:match("Windows")
local prettier_cmd = is_windows
    and "C:\\Users\\F081804\\AppData\\Roaming\\npm\\prettier.cmd"
    or "prettier"

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
        command = prettier_cmd,
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
