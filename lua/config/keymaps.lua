-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

require("config.format")
require("config.repmo")

local set = vim.keymap.set

-- Editing
set("n", "<Home>", "^", { remap = false })
set("n", "'", ";", { remap = true })

set("n", "H", function()
  require("treesj").toggle()
end, { desc = "Split/Join" })

set("n", "<leader>bd", function()
  local filepath = vim.api.nvim_buf_get_name(0)
  if
    vim.bo.modified
    and filepath ~= ""
    and vim.fn.filereadable(filepath) == 1
    and vim.fn.filewritable(filepath) == 1
  then
    pcall(vim.cmd.write)
  end
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })

-- Jetbrains keymap ish
set({ "n", "v" }, "<A-CR>", "<leader>ca", { remap = true, desc = "Code action" })
set({ "n", "v" }, "<S-F6>", "<leader>cr", { remap = true, desc = "Rename" })
set({ "n", "v" }, "<C-S-N>", "<leader>fF", { remap = true, desc = "Find files" })
set({ "n", "v" }, "<M-C-S-N>", "<leader>sS", { remap = true, desc = "Search symbols" })

-- Get out of the way of gr<motion>
pcall(vim.keymap.del, "n", "gra")
pcall(vim.keymap.del, "n", "gri")
set("n", "gR", function()
  Snacks.picker.lsp_references()
end, { nowait = true, desc = "References" })

-- gsc as alias of gsr
set("n", "gsc", "gsr", { remap = true })

-- Terminal

-- easier exit
set("t", "<C-.>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Buffers
set("n", "<A-Right>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
set("n", "<A-Left>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
set("n", "<A-BS>", "<leader>bd", { remap = true })

set("n", "<C-A-Left>", vim.cmd.BufferLineMovePrev, { desc = "Move buffer left" })
set("n", "<C-A-Right>", vim.cmd.BufferLineMoveNext, { desc = "Move buffer right" })

-- Windows
set("n", "<C-S-Right>", "<C-w>l", { desc = "Focus right window" })
set("n", "<C-S-Left>", "<C-w>h", { desc = "Focus left window" })
set("n", "<C-S-Up>", "<C-w>k", { desc = "Focus up window" })
set("n", "<C-S-Down>", "<C-w>j", { desc = "Focus down window" })
set("n", "<C-S-Home>", "<C-w><C-w>", { desc = "Cycle windows" })

set("n", "<C-S-BS>", "<C-w>q", { desc = "Close window" })
set("n", "<C-h>", "<C-w>q", { desc = "Close window" })

-- Utils
set("n", "<leader>sx", "<leader>sR", { remap = true, desc = "Search Resume" })

set("n", "<leader>z", "", { desc = "goto related files" })
set("n", "<leader>zc", vim.cmd.ClangdSwitchSourceHeader, { desc = "Swap h/cpp" })

-- Misc
pcall(require, "config._local-keymaps")

vim.api.nvim_set_hl(0, "@module", {
  foreground = "#e5c890",
  italic = true,
})
