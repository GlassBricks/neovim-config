-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.clipboard = ""

opt.swapfile = false
opt.autowriteall = true

opt.winbar = "%=%m %f"
opt.shell = "fish"

local g = vim.g
g.ai_cmp = false
