local essentials = {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({})
    end,
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup({})
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({})
    end,
  },

  -- {
  --   "gcmt/cmdfix.nvim",
  --   config = function()
  --     require("cmdfix").setup({
  --       Bda = "bda",
  --       Format = "format",
  --       FixImports = "fiximports",
  --       SortImports = "sortimports",
  --       RemoveUnused = 'removeunused',
  --       Lazy = "Lazy",
  --     })
  --   end,
  -- }
}

return essentials
