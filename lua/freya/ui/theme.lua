return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    priority = 1000,
    config = function()
      require("github-theme").setup({
        options = {
          styles = {
            comments = 'italic',
            keywords = 'bold',
            functions = 'bold',
          },
        },
      })
      vim.cmd("colorscheme github_dark_default")
    end,
  },
}
