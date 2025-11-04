-- =========================
-- Plugin manager
-- =========================
require("freya.lazy")

-- =========================
-- UI
-- =========================
require("freya.core.options")
require("freya.core.keymaps")

-- =========================
-- UI
-- =========================
require('freya.ui.diagnostic')
require('freya.ui.lualine')
require('freya.ui.nvim_tree')
require("freya.ui.nvim_treesitter")
require('freya.ui.telescope')
require('freya.ui.theme')

-- =========================
-- Tools
-- =========================
require("gitsigns").setup()
require('freya.tools.autocomplete')
require('freya.tools.debug')
require('freya.tools.lsp')
require("freya.tools.mason")

-- =========================
-- Languages
-- =========================
require("freya.langs.typescript")
