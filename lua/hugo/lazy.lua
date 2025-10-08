-- =========================
-- Bootstrap lazy.nvim
-- =========================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy_plugins = {
  -- LSP + tooling
  { "williamboman/mason.nvim",         build = ":MasonUpdate" },
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  -- Completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  -- Syntax
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- UI
  "nvim-tree/nvim-tree.lua",
  "nvim-lualine/lualine.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-lua/plenary.nvim",
  "lewis6991/gitsigns.nvim",

  {
    "Mofiqul/vscode.nvim",
    config = function()
      require("vscode").setup({
        transparent = false, -- keep background solid
        italic_comments = true,
        disable_nvimtree_bg = true,
      })
      vim.cmd("colorscheme vscode")
    end,
  },

  require("hugo.plugins.format"),
  require("hugo.plugins.debug"),
}

vim.list_extend(lazy_plugins, require("hugo.plugins.essentials"))

require("lazy").setup(lazy_plugins)
