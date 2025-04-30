-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set

-- Editing
set("n", "<Home>", "^", { remap = false })
set("n", "'", ";", { remap = true })

-- Nav

-- Get out of the way of gr<motion>
pcall(vim.keymap.del, "n", "gra")
pcall(vim.keymap.del, "n", "gri")
set("n", "gR", function()
  Snacks.picker.lsp_references()
end, { nowait = true, desc = "References" })

-- Buffers
set("n", "<A-Right>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
set("n", "<A-Left>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
set("n", "<A-BS>", "<leader>bd", { remap = true })

-- Windows
set("n", "<C-S-Right>", "<C-w>l", { desc = "Focus right window" })
set("n", "<C-S-Left>", "<C-w>h", { desc = "Focus left window" })
set("n", "<C-S-Up>", "<C-w>k", { desc = "Focus up window" })
set("n", "<C-S-Down>", "<C-w>j", { desc = "Focus down window" })
set("n", "<C-S-Home>", "<C-w><C-w>", { desc = "Cycle windows" })

-- local csbs_key = "<C-S-BS>"
local csbsp_key = "<C-h>"
set("n", csbsp_key, "<C-w>q", { desc = "Close window" })
