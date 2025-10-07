-- === Global Search & Replace Helper ===
-- Requires no external plugins (works even with nvim-tree)

-- Quick input helpers
local function input(prompt, default)
  vim.fn.inputsave()
  local result = vim.fn.input(prompt, default or "")
  vim.fn.inputrestore()
  return result
end

-- Perform project-wide search and optional replace
local function ProjectReplace()
  local search = input("Find: ")
  if search == "" then
    print("Cancelled")
    return
  end

  local replace = input("Replace (leave empty to just search): ")
  local file_glob = input("File pattern (default **/*.*): ", "**/*.*")

  -- Run the search
  vim.cmd("vimgrep /" .. search .. "/gj " .. file_glob)
  vim.cmd("copen")

  if replace ~= "" then
    local confirm = input("Confirm each change? (y/n): ", "y")
    local flag = (confirm == "y" or confirm == "Y") and "gc" or "g"
    vim.cmd("cfdo %s/" .. search .. "/" .. replace .. "/" .. flag .. " | update")
    print("Replaced across project ✅")
  else
    print("Search complete. Use :copen to browse results.")
  end
end

vim.api.nvim_create_user_command("ProjectReplace", ProjectReplace, { desc = "Global find & replace across project" })

-- Optional Telescope integration (if you have it)
local function TelescopeLiveGrep()
  local ok, telescope = pcall(require, "telescope.builtin")
  if not ok then
    vim.notify("Telescope not installed. Falling back to :ProjectReplace", vim.log.levels.WARN)
    ProjectReplace()
    return
  end
  telescope.live_grep()
end

vim.api.nvim_create_user_command("ProjectSearch", TelescopeLiveGrep, { desc = "Telescope live grep or fallback search" })

-- === Keymaps ===
vim.keymap.set("n", "<leader>sr", ":ProjectReplace<CR>", { desc = "Global search & replace" })
vim.keymap.set("n", "<leader>ss", ":ProjectSearch<CR>", { desc = "Global search (Telescope)" })
