-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.clipboard = ""

opt.swapfile = false
opt.autowriteall = true

opt.winblend = 70
opt.winbar = "%=%m %f"
opt.shell = "fish"

---@class LazyVimGlobals
local g = vim.g
g.ai_cmp = false

-- LazyVim auto format mode
-- Can be one of: file, changes
-- if set to changes only format actual changes based on git hunks
-- otherwise format all the file
g.formatmode = "changes"

--- LazyVim auto format changes only mode will be ignored
--- for these filetypes and fallback to file
g.format_range_exclude_ft = { "lua" }

if g.neovide then
  require("config.neovide")
end
