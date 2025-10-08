require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "typescript", "javascript", "json", "tsx", "html", "css" },
  highlight = {
    enable = true, additional_vim_regex_highlighting = false
  },
})
