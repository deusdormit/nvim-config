-- =========================
-- Load repo debug config
-- =========================
local local_dap = vim.fn.getcwd() .. "/.nvim/dap.lua"
if vim.fn.filereadable(local_dap) == 1 then
  dofile(local_dap)
end
