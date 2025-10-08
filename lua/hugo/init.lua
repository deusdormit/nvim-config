-- =========================
-- Plugin manager
-- =========================
require("hugo.lazy")

-- =========================
-- UI
-- =========================
require("hugo.core.keymaps")
require("hugo.core.options")

-- =========================
-- UI
-- =========================
require('hugo.ui.diagnostic')
require('hugo.ui.lualine')
require('hugo.ui.nvim_tree')
require("hugo.ui.nvim_treesitter")
require('hugo.ui.telescope')

-- =========================
-- Tools
-- =========================
require("gitsigns").setup()
require('hugo.tools.autocomplete')
require('hugo.tools.lsp')
require("hugo.tools.mason")

-- =========================
-- Languages
-- =========================
require("hugo.langs.typescript")
